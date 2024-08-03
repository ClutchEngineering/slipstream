/// A component for fixing an element's width to the current breakpoint.
///
/// A ``Container`` is a ``Div``, and is similarly used to organize child
/// views together.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Container {
///         Text("Hello, world!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: Tailwind CSS' [`container`](https://tailwindcss.com/docs/container) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct Container<Content: View>: View {
  /// Creates a Container view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public var body: some View {
    Div {
      content()
    }
    .modifier(ClassModifier(add: "container"))
  }

  private let content: () -> Content
}
