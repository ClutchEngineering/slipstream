/// A view that provides fallback parentheses for ruby annotations.
///
/// The RubyParenthesis element is used to provide parentheses around ruby
/// text for browsers that don't support ruby annotations. Browsers that
/// support ruby will hide this element, while those that don't will display
/// it, ensuring the annotation text appears in parentheses.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         Ruby {
///           DOMString("明日")
///           RubyParenthesis("(")
///           RubyText("Ashita")
///           RubyParenthesis(")")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// In browsers that support ruby, this will display as "明日" with "Ashita"
/// above it. In browsers that don't support ruby, it will display as
/// "明日(Ashita)".
///
/// - SeeAlso: W3C [`rp`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-rp-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct RubyParenthesis<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "rp"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a RubyParenthesis view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a RubyParenthesis view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
