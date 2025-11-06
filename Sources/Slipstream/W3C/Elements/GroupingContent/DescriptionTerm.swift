/// A view that represents the term part of a term-description group in a description list.
///
/// The `<dt>` element represents a term or name in a description list (`DescriptionList`).
/// It is typically followed by one or more `DescriptionDetails` elements that provide
/// the description or definition of the term.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       DescriptionList {
///         DescriptionTerm("HTML")
///         DescriptionDetails {
///           DOMString("HyperText Markup Language")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`dt`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dt-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DescriptionTerm<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "dt"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a DescriptionTerm view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a DescriptionTerm view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
