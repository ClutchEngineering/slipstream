/// A view that represents the ruby text component of a ruby annotation.
///
/// The RubyText element contains the annotation text (typically pronunciation
/// or meaning) that appears above or beside the base text in a ``Ruby`` element.
/// It should be used as a child of a Ruby element.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         Ruby {
///           DOMString("東京")
///           RubyText("とうきょう")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`rt`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-rt-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct RubyText<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "rt"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a RubyText view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a RubyText view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
