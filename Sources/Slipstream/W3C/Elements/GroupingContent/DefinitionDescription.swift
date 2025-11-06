/// Represents the description part of a term-description group in a definition list.
///
/// Use this element within a definition list to provide the description or definition
/// for a term specified by a definition term element.
///
/// ```swift
/// // Inside a definition list
/// DefinitionDescription {
///   "A markup language for creating web pages"
/// }
/// ```
///
/// - SeeAlso: W3C [dd](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dd-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DefinitionDescription<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "dd"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a definition description.
  ///
  /// - Parameter content: The description content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a definition description with static text.
  ///
  /// - Parameter text: The description text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
