/// A view that represents the dominant contents of the document.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Main {
///         Text("Hello, world!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [main](https://html.spec.whatwg.org/multipage/grouping-content.html#hierarchically-correct-main-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DocumentMain<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "main"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a DocumentMain view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
