# How Slipstream works

A from the ground up explanation of Slipstream's architecture.

Slipstream is designed to offer a SwiftUI-like approach to building HTML documents
that are compatible with [Tailwind CSS](http://tailwindcss.com).

## Core Concepts

### Result Builders

Slipstream uses Swift [result builders](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0289-result-builders.md)
to enable the construction of HTML documents in a syntax similar to SwiftUI's.
Result builders encourage defining structural data in a hierarchical and declarative
manner, separating intent (what the site should look like) from implementation (how
it's turned into HTML). This separation of concerns allows you to focus on the
design and structure of your web pages without getting bogged down by the
intricacies of HTML generation.

### View Protocol

The primary type that Slipstream's result builders work with is the ``View`` protocol.
Like SwiftUI, a View represents a part of an HTML document that can be combined
with other View instances to create a website. The protocol defines a contract
that all views must adhere to, ensuring consistency in how views are constructed and
rendered as HTML.

```swift
public protocol View {
  associatedtype Content: View
  @ViewBuilder var body: Self.Content { get }

  func render(_ container: Element) throws
}
```

The ``View/body`` property returns the content of the view, and in most cases, is
the only part of the View protocol that you need to implement. The ``ViewBuilder``
attribute is what enables our use of the SwiftUI-like syntax in the body implementation.

The ``View/render(_:)`` method, on the other hand, is responsible for converting the
view’s content into HTML elements. You'll only need to implement this method if you
need to generate new types of HTML.

### W3C HTML Views

Slipstream provides a catalog of standard [W3C HTML](https://html.spec.whatwg.org/multipage/)
View implementations that can be used to build your website. Read <doc:Fundamentals> to
learn more about the different Views available in Slipstream.

### Rendering a View as HTML

The combination of result builders, the View protocol, and a ``Text`` view is all we
need to build a simple "Hello, world!" example:

```swift
struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
```

In this example, the Text view is treated as a single "block" in HelloWorld's body.

The ``renderHTML(_:)`` method creates a SwiftSoup Document object and then passes this
document to the HelloWorld's ``View/render(_:)`` method, which in turn calls Text's
`render(_:)` method, which appends the string to the Document object.

