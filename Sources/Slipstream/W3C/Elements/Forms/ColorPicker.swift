import SwiftSoup

/// A control that allows the user to select a color.
///
/// This represents an HTML color input element that provides a color picker
/// interface. The value is a color in hexadecimal format.
///
/// ```swift
/// // Basic color picker
/// ColorPicker()
///
/// // Color picker with default value
/// ColorPicker(value: "#ff5733")
///
/// // Color picker with form association
/// ColorPicker(name: "theme-color", value: "#3498db")
///
/// // Color picker with accessibility features
/// ColorPicker(name: "accent", id: "accent-color", autoFocus: true)
/// ```
///
/// - SeeAlso: W3C [input type="color"](https://html.spec.whatwg.org/multipage/input.html#color-state-(type=color)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ColorPicker: View {
  /// Creates a color picker input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - value: The default color value in hexadecimal format (e.g., "#ff0000").
  ///     If not specified, defaults to "#000000" (black) per HTML spec.
  ///   - id: The unique identifier for the color picker, used for label association.
  ///   - autoFocus: If true, indicates that the color picker should be focused as soon as
  ///     the page is loaded, allowing the user to interact with it without having to
  ///     manually focus it first.
  public init(name: String? = nil, value: String? = nil, id: String? = nil, autoFocus: Bool = false) {
    self.name = name
    self.value = value
    self.id = id
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "color")

    if let name {
      try element.attr("name", name)
    }
    if let value {
      try element.attr("value", value)
    }
    if let id {
      try element.attr("id", id)
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let name: String?
  private let value: String?
  private let id: String?
  private let autoFocus: Bool
}
