/// A view that represents the defining instance of a term.
///
/// The `<dfn>` element represents the defining instance of a term in HTML. It marks
/// the term being defined within its nearest ancestor paragraph, description list group,
/// or section. The term inside `<dfn>` is considered to be defined by the surrounding context.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("The ")
///         Definition("DOM")
///         DOMString(" (Document Object Model) is a programming interface for web documents.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`dfn`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-dfn-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Definition<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "dfn"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Definition view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Definition view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
