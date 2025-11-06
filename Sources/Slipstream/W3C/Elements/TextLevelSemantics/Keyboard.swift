/// A view that represents user input from a keyboard, voice input, or other text entry device.
///
/// Use this element to mark up keyboard input, menu selections, or other user input
/// instructions. The ``Keyboard`` element represents user input, not computer output
/// (use ``SampleOutput`` for that).
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("Press ")
///         Keyboard("Ctrl")
///         DOMString("+")
///         Keyboard("C")
///         DOMString(" to copy.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`kbd`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-kbd-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Keyboard<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "kbd"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Keyboard view.
  ///
  /// - Parameter content: The keyboard input content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Keyboard view with static text.
  ///
  /// - Parameter text: The keyboard input text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
