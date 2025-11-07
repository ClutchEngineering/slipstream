import SwiftSoup

/// A view that represents a word break opportunity.
///
/// The WordBreakOpportunity element represents a position within text where the browser
/// may optionally break a line, though its line-breaking rules would not otherwise
/// create a break at that location.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("This")
///         WordBreakOpportunity()
///         DOMString("IsA")
///         WordBreakOpportunity()
///         DOMString("Very")
///         WordBreakOpportunity()
///         DOMString("Long")
///         WordBreakOpportunity()
///         DOMString("Word")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`wbr`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-wbr-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct WordBreakOpportunity: View {
  /// Creates a WordBreakOpportunity view.
  public init() {
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    _ = try container.appendElement("wbr")
  }
}
