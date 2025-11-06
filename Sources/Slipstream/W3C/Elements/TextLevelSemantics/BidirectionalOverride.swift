import SwiftSoup

/// A view that overrides the current directionality of text.
///
/// Use `BidirectionalOverride` to explicitly set text directionality, forcing
/// the text to be rendered in a specific direction regardless of its content.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Paragraph {
///       BidirectionalOverride(.rightToLeft) {
///         DOMString("This text will be displayed right-to-left")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`bdo`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-bdo-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct BidirectionalOverride<Content>: View where Content: View {
  /// The text directionality.
  public enum Direction: String, Sendable {
    /// Left-to-right text direction.
    case leftToRight = "ltr"
    /// Right-to-left text direction.
    case rightToLeft = "rtl"
  }

  /// Creates a BidirectionalOverride view with custom content.
  ///
  /// - Parameters:
  ///   - direction: The text direction to enforce.
  ///   - content: The content to render with the specified direction.
  public init(_ direction: Direction, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.direction = direction
    self.content = content
  }

  /// Creates a BidirectionalOverride view with plain text.
  ///
  /// - Parameters:
  ///   - text: The text content.
  ///   - direction: The text direction to enforce.
  public init(_ text: String, direction: Direction) where Content == DOMString {
    self.direction = direction
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("bdo")
    try element.attr("dir", direction.rawValue)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let direction: Direction
}
