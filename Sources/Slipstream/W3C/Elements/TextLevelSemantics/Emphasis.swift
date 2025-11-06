/// A view that represents stress emphasis of its contents.
///
/// The `<em>` element is used to emphasize text, which typically results in
/// italic styling. The level of emphasis can be increased by nesting `em` elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("I ")
///         Emphasis("really")
///         DOMString(" want to go to the concert.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`em`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-em-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Emphasis<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "em"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an Emphasis view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an Emphasis view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
