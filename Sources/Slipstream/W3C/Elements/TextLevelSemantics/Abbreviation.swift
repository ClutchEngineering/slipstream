/// A view that represents an abbreviation or acronym.
///
/// The Abbreviation element can be used to mark up abbreviations
/// and acronyms. The optional expansion or description can be provided
/// using the `title` attribute.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Abbreviation("HTML")
///         .title("HyperText Markup Language")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`abbr`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-abbr-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Abbreviation<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "abbr"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an abbreviation view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an abbreviation view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
