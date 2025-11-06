/// A view that provides the description, definition, or value for a term in a description list.
///
/// The `<dd>` element represents the description part of a term-description group in
/// a description list (`DescriptionList`). It provides details, definitions, or values
/// for the preceding term(s) specified by `DescriptionTerm` elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       DescriptionList {
///         DescriptionTerm("CSS")
///         DescriptionDetails {
///           DOMString("Cascading Style Sheets - used for styling web pages")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`dd`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dd-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DescriptionDetails<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "dd"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a DescriptionDetails view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
