/// A view that represents a summary, caption, or legend for a details element.
///
/// The summary element represents a summary, caption, or legend for the rest
/// of the contents of the summary element's parent details element, if any.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Details {
///         Summary("Click to expand")
///         Paragraph("This is the expanded content.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`summary`](https://html.spec.whatwg.org/multipage/interactive-elements.html#the-summary-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Summary<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "summary"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a summary element.
  ///
  /// - Parameter content: A view builder that creates the summary's content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a summary with static text.
  ///
  /// - Parameter text: The text content of the summary.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
