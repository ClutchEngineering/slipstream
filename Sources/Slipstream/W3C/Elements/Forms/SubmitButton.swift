import SwiftSoup

/// A button that submits its form.
///
/// A submit button is a button that submits the form data to the server when clicked.
///
/// ```swift
/// Form(action: "/submit", method: .post) {
///   TextField("Enter your name", name: "username")
///   SubmitButton("Sign up")
/// }
/// ```
///
/// - SeeAlso: W3C [input type="submit"](https://html.spec.whatwg.org/multipage/input.html#submit-button-state-(type=submit)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SubmitButton: View {
  /// Creates a submit button with a label.
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
    try element.attr("type", "submit")
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
