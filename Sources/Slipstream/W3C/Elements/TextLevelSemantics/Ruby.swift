/// A view that represents ruby annotations.
///
/// Ruby annotations are small annotations displayed above or beside base text,
/// primarily used in East Asian typography to show pronunciation or meaning
/// of characters. The Ruby element acts as a container for base text along
/// with ``RubyText`` and optionally ``RubyParenthesis`` elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         Ruby {
///           DOMString("漢")
///           RubyParenthesis("(")
///           RubyText("kan")
///           RubyParenthesis(")")
///           DOMString("字")
///           RubyParenthesis("(")
///           RubyText("ji")
///           RubyParenthesis(")")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`ruby`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-ruby-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Ruby<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "ruby"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Ruby view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
