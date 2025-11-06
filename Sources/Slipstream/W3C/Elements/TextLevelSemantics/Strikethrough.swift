/// Represents contents that are no longer accurate or no longer relevant.
///
/// Commonly used to display text that has been deleted or is no longer valid.
///
/// ```swift
/// Strikethrough {
///   "This text is no longer valid"
/// }
/// ```
///
/// - SeeAlso: W3C [s](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-s-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Strikethrough<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "s"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Strikethrough view.
  ///
  /// - Parameter content: The content to be marked as no longer accurate or relevant.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Strikethrough view with static text.
  ///
  /// - Parameter text: The text to be marked as no longer accurate or relevant.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
