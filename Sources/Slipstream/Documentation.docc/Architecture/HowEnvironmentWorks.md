# How @Environment works

How the @Environment property enables read/write access to environment values.

The ``Environment`` property wrapper enables views to read environment values
based on the context the view is being rendered in, and the ``View/environment(_:_:)``
modifier allows views to mutate the environment for a sub-tree of views.

Reading values from ``Environment`` is fairly straightforward; the property
wrapper simply returns the requested key value property from the property wrapper's
internal ``EnvironmentValues`` storage.

But how do we make sure that the ``EnvironmentValues`` reflect our current
context's environment values?

Consider a typical example where we inject an environment value into a view
instance:

```swift
MyView()
  .environment(\.path, "/home")
```

And then read that value within the view instance:

```swift
struct MyView: View {
  @Environment(\.path) var path

  var body: some View {
    Text(path)
  }
}
```

When MyView is rendered, ``View/render(_:environment:)`` is invoked with the
parent context's ``EnvironmentValues``, which has had the `.path` property
set to "/home". But how does `path`, which is being read from within `body`,
know to use the given parent context?

This is where the default implementation of ``View/render(_:environment:)``
comes into play.

## Type introspection and value injection

``View``'s default implementation of ``View/render(_:environment:)`` includes
a method called `injectEnvironment` that has the following signature:

```swift
func injectEnvironment(environment: EnvironmentValues) throws -> Self
```

Note that it returns an instance of Self; in this case, a copy of self with
the given environment values injected into any `@Environment` property
wrappers.

How does this method know which properties are property wrappers? Using
type introspection.

Swift provides the [`Mirror`](https://developer.apple.com/documentation/swift/mirror)
type as a way to perform read-only type introspection, but we need to be
able to mutate the property wrappers so this API unfortunately doesn't meet
our needs. Instead, we need to rely on three private Swift APIs:

- `swift_reflectionMirror_recursiveCount`: Returns the number of properties within in a Type.
- `swift_reflectionMirror_recursiveChildMetadata` Returns traits, such as mutability, of a property within in a Type.
- `swift_reflectionMirror_recursiveChildOffset` Returns the in-memory offset of the property's storage, allowing for reading/writing of the property's value.

These three APIs are wrapped up in Slipstream's package-visible `TypeIntrospection`
API, originally forked from [gor-gyolchanyan-swift/introspection-kit](https://github.com/gor-gyolchanyan-swift/introspection-kit).
`TypeIntrospection` gives us a mechanism for enumerating each of the properties
contained within a type, in this case our View type, and to then mutate them on
a copied instance of the view.

When we render the view, we create a copy, inject the current environment values
into any detected ``Environment`` property wrappers, and then invoke the view's
``View/body``. This ensures that when the view's body logic runs, the correct
environment values have been injected into the view.

[View the full source for this solution in View.swift](https://github.com/jverkoey/slipstream/blob/main/Sources/Slipstream/Views/Fundamentals/View.swift).
