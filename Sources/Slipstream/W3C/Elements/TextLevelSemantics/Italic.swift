/// A view that represents a span of text in an alternate voice or mood, or otherwise
/// offset from the normal prose.
///
/// The `<i>` element is used for text that is set off from the normal prose for readability
/// or semantic reasons, such as foreign words, technical terms, taxonomic designations,
/// thoughts, or ship names.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("The ")
///         Italic("HMS Beagle")
///         DOMString(" sailed to the Galápagos Islands.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`i`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-i-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Italic<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "i"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an Italic view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an Italic view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
