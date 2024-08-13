import SwiftSoup

/// Constants that control the content type of a ``TextField``.
///
/// - SeeAlso: W3C [input type](https://html.spec.whatwg.org/multipage/input.html#attr-input-type) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum TextFieldInputType: String {
  /// Represents a one line plain text edit control.
  ///
  /// This is the default input type if no type is provided.
  ///
  /// - SeeAlso: W3C [input type="text"](https://html.spec.whatwg.org/multipage/input.html#text-(type=text)-state-and-search-state-(type=search)) specification.
  case text

  /// Similar to ``text``
  ///
  /// Note from the W3C spec: The difference between the ``text`` state and the
  /// ``search`` state is primarily stylistic: on platforms where search controls
  /// are distinguished from regular text controls, the ``search`` state might
  /// result in an appearance consistent with the platform's search controls
  /// rather than appearing like a regular text control.
  ///
  /// - SeeAlso: W3C [input type="search"](https://html.spec.whatwg.org/multipage/input.html#text-(type=text)-state-and-search-state-(type=search)) specification.
  case search

  /// Represents a control for editing a telephone number.
  ///
  /// - SeeAlso: W3C [input type="tel"](https://html.spec.whatwg.org/multipage/input.html#telephone-state-(type=tel)) specification.
  case telephone = "tel"

  /// Represents a control for editing a single absolute URL.
  ///
  /// - SeeAlso: W3C [input type="url"](https://html.spec.whatwg.org/multipage/input.html#url-state-(type=url)) specification.
  case url

  /// Represents a control for editing an email.
  case email
  ///
  /// - SeeAlso: W3C [input type="email"](https://html.spec.whatwg.org/multipage/input.html#email-state-(type=email)) specification.

  /// Represents a one line plain text edit control.
  ///
  /// The browser will typically obscure the value so that people other than
  /// the user cannot see it.
  ///
  /// - SeeAlso: W3C [input type="password"](https://html.spec.whatwg.org/multipage/input.html#password-state-(type=password)) specification.
  case password

  /// Represents a control for setting the view''s value to a string
  /// representing a specific date.
  ///
  /// - SeeAlso: W3C [input type="date"](https://html.spec.whatwg.org/multipage/input.html#date-state-(type=date)) specification.
  case date

  /// Represents a control for setting the view''s value to a string
  /// representing a specific month.
  ///
  /// - SeeAlso: W3C [input type="month"](https://html.spec.whatwg.org/multipage/input.html#month-state-(type=month)) specification.
  case month

  /// Represents a control for setting the view''s value to a string
  /// representing a specific week.
  ///
  /// - SeeAlso: W3C [input type="week"](https://html.spec.whatwg.org/multipage/input.html#week-state-(type=week)) specification.
  case week

  /// Represents a control for setting the view''s value to a string
  /// representing a specific time.
  ///
  /// - SeeAlso: W3C [input type="time"](https://html.spec.whatwg.org/multipage/input.html#time-state-(type=time)) specification.
  case time

  /// Represents a control for setting the view''s value to a string
  /// representing a local date and time, with no time-zone offset
  /// information.
  ///
  /// - SeeAlso: W3C [input type="datetime-local"](https://html.spec.whatwg.org/multipage/input.html#local-date-and-time-state-(type=datetime-local)) specification.
  case localDateAndTime = "datetime-local"

  /// Represents a control for setting the view''s value to a string
  /// representing a number.
  ///
  /// - SeeAlso: W3C [input type="number"](https://html.spec.whatwg.org/multipage/input.html#number-state-(type=number)) specification.
  case number
}

/// A control that displays an editable text interface.
///
/// - SeeAlso: W3C [input](https://html.spec.whatwg.org/multipage/input.html#the-input-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TextField: View {
  /// Creates a text field with a text label.
  ///
  /// - Parameters:
  ///   - text: The placeholder text to display in the text field when it is empty.
  ///   - type: The text field's content type.
  ///   - name: The name of the form control, as used in form submission.
  ///   - autoFocus: If true, indicates that the view should be focused as soon as
  ///   the page is loaded, allowing the user to start typing without having to
  ///   manually focus the main view.
  public init(_ text: String, type: TextFieldInputType = .text, name: String? = nil, autoFocus: Bool = false) {
    self.text = text
    self.type = type
    self.name = name
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", type.rawValue)
    try element.attr("placeholder", text)
    if let name {
      try element.attr("name", name)
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let text: String
  private let autoFocus: Bool
  private let type: TextFieldInputType
  private let name: String?
}
