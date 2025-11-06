import Foundation

import SwiftSoup

/// A view that links content with a machine-readable translation.
///
/// The Data element is used to link human-readable content with a machine-readable
/// value. This is useful for providing data that can be processed by scripts or
/// software while still presenting it in a user-friendly format.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("Product code: ")
///         Data("AB-123", value: "123456789")
///       }
///     }
///   }
/// }
/// ```
///
/// Common use cases include product IDs, UPC codes, or any situation where you
/// want to provide both human-readable and machine-readable versions of data.
///
/// - SeeAlso: W3C [`data`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-data-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Data<Content>: View where Content: View {
  /// Creates a Data view with optional machine-readable value.
  ///
  /// - Parameters:
  ///   - value: An optional machine-readable value associated with the content.
  ///   - content: A ViewBuilder that creates the human-readable content.
  public init(value: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.value = value
    self.content = content
  }

  /// Creates a Data view with static text and optional machine-readable value.
  ///
  /// - Parameters:
  ///   - text: The human-readable text content to display.
  ///   - value: An optional machine-readable value associated with the text.
  public init(_ text: String, value: String? = nil) where Content == DOMString {
    self.value = value
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("data")

    if let value {
      try element.attr("value", value)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let value: String?
}
