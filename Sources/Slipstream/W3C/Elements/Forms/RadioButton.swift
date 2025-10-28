import SwiftSoup

/// A control that allows the user to select a single option from a group of options.
///
/// This represents an HTML radio button input element that can be used for
/// CSS-only interactions, form submissions, or interactive components.
///
/// ```swift
/// // Basic radio button
/// RadioButton()
///
/// // Radio button with form association
/// RadioButton(name: "color", value: "red")
///
/// // Pre-checked radio button with ID for label association
/// RadioButton(name: "size", value: "medium", id: "size-medium", checked: true)
///
/// // Radio button with accessibility features
/// RadioButton(name: "subscription", value: "premium", required: true, autoFocus: true)
/// ```
///
/// - SeeAlso: W3C [input type="radio"](https://html.spec.whatwg.org/multipage/input.html#radio-button-state-(type=radio)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct RadioButton: View {
  /// Creates a radio button input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission. Radio buttons
  ///     with the same name form a group where only one can be selected at a time.
  ///   - value: The value to be sent when the radio button is checked and the form is submitted.
  ///   - id: The unique identifier for the radio button, used for label association.
  ///   - checked: Whether the radio button should be checked by default.
  ///   - required: If true, indicates that the user must select one of the radio buttons
  ///     in the group before the owning form can be submitted.
  ///   - autoFocus: If true, indicates that the radio button should be focused as soon as
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
    try element.attr("type", "radio")
    
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
