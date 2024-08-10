import SwiftSoup

/// A control that displays an editable text interface.
///
/// - SeeAlso: W3C [input](https://html.spec.whatwg.org/multipage/input.html#the-input-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TextField: View {
  /// Creates a text field with a text label.
  ///
  /// - Parameters:
  ///   - text: The placeholder text to display in the text field when it is empty.
  ///   - autoFocus: If true, indicates that the view should be focused as soon as
  ///   the page is loaded, allowing the user to start typing without having to
  ///   manually focus the main view.
  public init(_ text: String, autoFocus: Bool = false) {
    self.text = text
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "text")
    try element.attr("placeholder", text)
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let text: String
  private let autoFocus: Bool
}
