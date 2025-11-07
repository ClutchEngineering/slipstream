import SwiftSoup

/// A control that is not displayed to the user but whose value is submitted with the form.
///
/// This represents an HTML hidden input element used to store data that should be
/// sent with the form but not displayed or modified by the user. Hidden fields are
/// commonly used for storing state, CSRF tokens, or other metadata.
///
/// ```swift
/// // Basic hidden field
/// HiddenField(name: "user_id", value: "12345")
///
/// // Hidden field for CSRF protection
/// HiddenField(name: "csrf_token", value: "a1b2c3d4e5")
///
/// // Hidden field with ID for JavaScript access
/// HiddenField(name: "session", value: "xyz", id: "session-id")
/// ```
///
/// - SeeAlso: W3C [input type="hidden"](https://html.spec.whatwg.org/multipage/input.html#hidden-state-(type=hidden)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct HiddenField: View {
  /// Creates a hidden input field.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - value: The value to be sent when the form is submitted.
  ///   - id: The unique identifier for the hidden field, useful for JavaScript access.
  public init(name: String, value: String, id: String? = nil) {
    self.name = name
    self.value = value
    self.id = id
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "hidden")
    try element.attr("name", name)
    try element.attr("value", value)

    if let id {
      try element.attr("id", id)
    }
  }

  private let name: String
  private let value: String
  private let id: String?
}
