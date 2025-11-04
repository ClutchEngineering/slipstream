/// A view that represents the title of a creative work.
///
/// The Cite element is used to mark up the title of a creative work
/// such as a book, paper, essay, poem, song, film, TV show, sculpture,
/// painting, theater production, play, opera, musical, exhibition, etc.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("My favorite book is ")
///         Cite("The Great Gatsby")
///         DOMString(".")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`cite`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-cite-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Cite<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "cite"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a citation view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a citation view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
