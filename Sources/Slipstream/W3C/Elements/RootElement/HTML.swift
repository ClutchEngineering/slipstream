/// A view that represents the root of an HTML document.
///
/// Every web page starts with an HTML view.
///
/// ```swift
/// struct MySite: View {
///   var body: some View {
///     HTML {
///       Head {
///       }
///       Body {
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`html`](https://html.spec.whatwg.org/multipage/semantics.html#the-html-element) specification.
///
/// ## See Also
///
/// - ``View/language(_:)``
@available(iOS 17.0, macOS 14.0, *)
public struct HTML<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "html"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an HTML view.
  ///
  /// - Parameter content: Should include a single ``Head`` view followed by a single ``Body`` view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
