# Environment values

Share data throughout a view hierarchy using the environment.

Like SwiftUI, views in Slipstream can react to configuration information
that they read from the environment using an ``Environment`` property wrapper.

A view inherits its environment from its container view, subject to explicit
changes from an ``View/environment(_:_:)`` view modifier. As a result, you
can configure an entire hierarchy of views by modifying the environment of
the group’s container.

## Defining custom environment values

To create a custom environment value, you first define a type that conforms
to the ``EnvironmentKey`` protocol. This type will be used to uniquely
identify the value in the environment.

```swift
struct PathEnvironmentKey: EnvironmentKey {
  static let defaultValue: String = "/"
}
```

You must then provide a way to read and write the environment value:

```swift
extension EnvironmentValues {
  var path: String {
    get { self[PathEnvironmentKey.self] }
    set { self[PathEnvironmentKey.self] = newValue }
  }
}
```

While not required, it's also a good practice to provide a ``View``
extension that modifies the environment value:

```swift
extension View {
  func path(_ path: String) -> some View {
    environment(\.path, path)
  }
}
```

### How to read environment properties

In any ``View``, you can read an environment value using the ``Environment``
property wrapper:

```swift
struct MyView: View {
  @Environment(\.path) var path

  // ...
}
```

You can then read the environment property like any other property on
the view. When the view is rendered, the value of the property will
reflect the environment this view is being rendered within. 

### How to change environment properties

Within the ``View/body`` of any view you can use the ``View/environment(_:_:)``
modifier to set the environment value for that view and its descendants.

```swift
MyView()
  .environment(\.path, "/home")
```


## Topics

### Accessing environment values

- ``Environment``
- ``EnvironmentValues``

### Creating custom environment values

- ``EnvironmentKey``
