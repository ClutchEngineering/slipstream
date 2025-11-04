import SwiftSoup

/// Constants that specify the wrapping behavior of a ``TextArea``.
///
/// - SeeAlso: W3C [wrap attribute](https://html.spec.whatwg.org/multipage/form-elements.html#attr-textarea-wrap) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum TextAreaWrap: String, Sendable {
  /// Lines are not wrapped when the form is submitted.
  case soft
  /// Lines are wrapped with newline characters when the form is submitted.
  case hard
}

/// A multiline plain text editing control.
///
/// The `TextArea` view creates an HTML textarea element, which allows users to enter
/// multiple lines of text. Unlike ``TextField``, which creates a single-line input,
/// `TextArea` is suitable for longer text content like comments, descriptions, or messages.
///
/// ```swift
/// TextArea("Enter your comments", name: "comments", rows: 5, cols: 40)
/// ```
///
/// - SeeAlso: W3C [textarea](https://html.spec.whatwg.org/multipage/form-elements.html#the-textarea-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TextArea: View {
  /// Creates a multiline text editing control.
  ///
  /// - Parameters:
  ///   - placeholder: Placeholder text to display when the textarea is empty.
  ///   - value: The default text content of the textarea.
  ///   - name: The name of the form control, used when submitting the form.
  ///   - rows: The number of visible text lines for the control.
  ///   - cols: The visible width of the text control, in average character widths.
  ///   - wrap: How the text should be wrapped when submitting the form.
  ///   - maxLength: The maximum number of characters that can be entered.
  ///   - autoFocus: Whether the textarea should automatically get focus when the page loads.
  ///   - required: Whether the textarea must be filled out before submitting the form.
  ///   - readOnly: Whether the textarea is read-only.
  ///   - disabled: Whether the textarea is disabled.
  public init(
    _ placeholder: String? = nil,
    value: String? = nil,
    name: String? = nil,
    rows: Int? = nil,
    cols: Int? = nil,
    wrap: TextAreaWrap? = nil,
    maxLength: Int? = nil,
    autoFocus: Bool = false,
    required: Bool = false,
    readOnly: Bool = false,
    disabled: Bool = false
  ) {
    self.placeholder = placeholder
    self.value = value
    self.name = name
    self.rows = rows
    self.cols = cols
    self.wrap = wrap
    self.maxLength = maxLength
    self.autoFocus = autoFocus
    self.required = required
    self.readOnly = readOnly
    self.disabled = disabled
  }

  private let placeholder: String?
  private let value: String?
  private let name: String?
  private let rows: Int?
  private let cols: Int?
  private let wrap: TextAreaWrap?
  private let maxLength: Int?
  private let autoFocus: Bool
  private let required: Bool
  private let readOnly: Bool
  private let disabled: Bool

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("textarea")

    if let placeholder {
      try element.attr("placeholder", placeholder)
    }
    if let name {
      try element.attr("name", name)
    }
    if let rows {
      try element.attr("rows", String(rows))
    }
    if let cols {
      try element.attr("cols", String(cols))
    }
    if let wrap {
      try element.attr("wrap", wrap.rawValue)
    }
    if let maxLength {
      try element.attr("maxlength", String(maxLength))
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
    if required {
      try element.attr("required", "")
    }
    if readOnly {
      try element.attr("readonly", "")
    }
    if disabled {
      try element.attr("disabled", "")
    }

    // Set the text content of the textarea if a value is provided
    if let value {
      try element.text(value)
    }
  }
}
