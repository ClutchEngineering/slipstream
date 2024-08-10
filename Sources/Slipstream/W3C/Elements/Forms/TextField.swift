import SwiftSoup

/// A control that displays an editable text interface.
///
/// - SeeAlso: W3C [`title`](https://html.spec.whatwg.org/multipage/input.html#the-input-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TextField: View {
  /// Creates a text field with a text label.
  public init(_ text: String) {
    self.text = text
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "text")
    try element.attr("placeholder", text)
  }

  private let text: String
}
