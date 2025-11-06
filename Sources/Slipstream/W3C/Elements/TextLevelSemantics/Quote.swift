import Foundation
import SwiftSoup

/// A view that represents a short inline quotation.
///
/// The Quote element is used for short quotations that don't require paragraph breaks.
/// Browsers typically render the content with quotation marks. For longer quotations
/// that require paragraph breaks, use the Blockquote element instead.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("As Abraham Lincoln said, ")
///         Quote("Whatever you are, be a good one.")
///       }
///     }
///   }
/// }
/// ```
///
/// You can optionally specify the source of the quotation using the `cite` parameter:
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         Quote("The only way to do great work is to love what you do.", cite: URL(string: "https://example.com/quotes"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`q`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-q-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Quote<Content>: View where Content: View {
  /// Creates a Quote view with optional citation.
  ///
  /// - Parameters:
  ///   - cite: An optional URL pointing to the source of the quotation.
  ///   - content: A ViewBuilder that creates the content of the quotation.
  public init(cite: URL? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.cite = cite
    self.content = content
  }

  /// Creates a Quote view with static text and optional citation.
  ///
  /// - Parameters:
  ///   - text: The text content of the quotation.
  ///   - cite: An optional URL pointing to the source of the quotation.
  public init(_ text: String, cite: URL? = nil) where Content == DOMString {
    self.cite = cite
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("q")

    if let cite {
      try element.attr("cite", cite.absoluteString)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let cite: URL?
}
