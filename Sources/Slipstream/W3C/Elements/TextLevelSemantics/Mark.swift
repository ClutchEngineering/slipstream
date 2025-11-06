/// A view that represents text highlighted for reference or notation purposes.
///
/// Use this element to mark or highlight text that has relevance in a particular context.
/// For example, it can be used to highlight search terms in search results, or to draw
/// attention to specific parts of a quote. The ``Mark`` element is not intended for
/// syntax highlighting (use ``Code`` for that).
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("Search results for ")
///         Mark("Slipstream")
///         DOMString(":")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`mark`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-mark-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Mark<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "mark"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Mark view.
  ///
  /// - Parameter content: The marked content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Mark view with static text.
  ///
  /// - Parameter text: The marked text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
