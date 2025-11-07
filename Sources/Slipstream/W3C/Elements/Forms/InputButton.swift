import SwiftSoup

/// A button with no default behavior.
///
/// An input button is a button that has no default behavior and is typically
/// used with JavaScript to implement custom functionality.
///
/// ```swift
/// Form {
///   TextField("Enter your name", name: "username")
///   InputButton("Click me", action: "handleClick()")
/// }
/// ```
///
/// - SeeAlso: W3C [input type="button"](https://html.spec.whatwg.org/multipage/input.html#button-state-(type=button)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct InputButton: View {
  /// Creates an input button with a label.
  ///
  /// - Parameters:
  ///   - text: The text label to display on the button.
  ///   - action: JavaScript code to execute when the button is clicked.
  ///   - name: The name of the form control, as used in form submission.
  ///   - autoFocus: If true, indicates that the view should be focused as soon as
  ///   the page is loaded, allowing the user to interact with it without having to
  ///   manually focus the main view.
  public init(_ text: String, action: String? = nil, name: String? = nil, autoFocus: Bool = false) {
    self.text = text
    self.action = action
    self.name = name
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "button")
    try element.attr("value", text)

    if let action {
      try element.attr("onclick", action)
    }
    if let name {
      try element.attr("name", name)
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let text: String
  private let action: String?
  private let name: String?
  private let autoFocus: Bool
}
