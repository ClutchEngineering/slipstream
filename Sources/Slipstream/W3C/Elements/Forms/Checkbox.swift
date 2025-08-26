import SwiftSoup

/// A control that allows the user to select or deselect an option.
///
/// This represents an HTML checkbox input element that can be used for
/// CSS-only interactions, form submissions, or interactive components.
///
/// ```swift
/// // Basic checkbox
/// Checkbox()
///
/// // Checkbox with form association
/// Checkbox(name: "preferences", value: "newsletter")
///
/// // Pre-checked checkbox with ID for label association
/// Checkbox(name: "menu-toggle", id: "menu-toggle", checked: true)
///
/// // Checkbox with accessibility features
/// Checkbox(name: "agreement", required: true, autoFocus: true)
/// ```
///
/// - SeeAlso: W3C [input type="checkbox"](https://html.spec.whatwg.org/multipage/input.html#checkbox-state-(type=checkbox)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Checkbox: View {
  /// Creates a checkbox input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - value: The value to be sent when the checkbox is checked and the form is submitted.
  ///   - id: The unique identifier for the checkbox, used for label association.
  ///   - checked: Whether the checkbox should be checked by default.
  ///   - required: If true, indicates that the user must check this checkbox before
  ///     the owning form can be submitted.
  ///   - autoFocus: If true, indicates that the checkbox should be focused as soon as
  ///     the page is loaded, allowing the user to interact with it without having to
  ///     manually focus it first.
  public init(name: String? = nil, value: String? = nil, id: String? = nil, checked: Bool = false, required: Bool = false, autoFocus: Bool = false) {
    self.name = name
    self.value = value
    self.id = id
    self.checked = checked
    self.required = required
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "checkbox")
    
    if let name {
      try element.attr("name", name)
    }
    if let value {
      try element.attr("value", value)
    }
    if let id {
      try element.attr("id", id)
    }
    if checked {
      try element.attr("checked", "")
    }
    if required {
      try element.attr("required", "")
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let name: String?
  private let value: String?
  private let id: String?
  private let checked: Bool
  private let required: Bool
  private let autoFocus: Bool
}
