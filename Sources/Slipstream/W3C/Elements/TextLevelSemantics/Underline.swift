/// A view that represents text with an unarticulated, though explicitly rendered,
/// non-textual annotation.
///
/// The `<u>` element is used for text that should be stylistically differentiated
/// from normal text, such as misspelled words or proper names in Chinese text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("This word is ")
///         Underline("misspelled")
///         DOMString(".")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`u`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-u-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Underline<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "u"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an Underline view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an Underline view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
