import SwiftSoup

/// A button that resets its form.
///
/// A reset button restores all form controls in the form to their default values.
///
/// ```swift
/// Form(action: "/submit", method: .post) {
///   TextField("Enter your name", name: "username")
///   ResetButton("Clear form")
/// }
/// ```
///
/// - SeeAlso: W3C [input type="reset"](https://html.spec.whatwg.org/multipage/input.html#reset-button-state-(type=reset)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ResetButton: View {
  /// Creates a reset button with a label.
  ///
  /// - Parameters:
  ///   - text: The text label to display on the button.
  ///   - name: The name of the form control, as used in form submission.
  ///   - autoFocus: If true, indicates that the view should be focused as soon as
  ///   the page is loaded, allowing the user to interact with it without having to
  ///   manually focus the main view.
  public init(_ text: String, name: String? = nil, autoFocus: Bool = false) {
    self.text = text
    self.name = name
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "reset")
    try element.attr("value", text)

    if let name {
      try element.attr("name", name)
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let text: String
  private let name: String?
  private let autoFocus: Bool
}
