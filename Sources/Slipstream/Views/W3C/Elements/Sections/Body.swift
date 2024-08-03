/// A view that represents the body of a document (as opposed to the document’s metadata).
///
/// Web pages use ``Body`` to define the content of the web page.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Text("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`body`](https://html.spec.whatwg.org/multipage/sections.html#the-body-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Body<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "body"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a Body view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
