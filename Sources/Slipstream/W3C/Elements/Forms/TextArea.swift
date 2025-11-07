import SwiftSoup

/// A multi-line plain-text editing control.
///
/// The TextArea element represents a multi-line plain-text edit control for the
/// element's raw value. It's particularly useful for entering longer pieces of
/// text, such as comments or messages.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Form {
///         TextArea("Enter your comment...", name: "comment")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`textarea`](https://html.spec.whatwg.org/multipage/form-elements.html#the-textarea-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct TextArea<Content>: View where Content: View {
  /// Creates a TextArea with custom content.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - rows: The number of visible text lines for the control.
  ///   - columns: The expected maximum number of characters per line.
  ///   - placeholder: A hint to the user of what can be entered in the control.
  ///   - content: A view builder that creates the textarea's content.
  public init(
    name: String? = nil,
    rows: Int? = nil,
    columns: Int? = nil,
    placeholder: String? = nil,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.name = name
    self.rows = rows
    self.columns = columns
    self.placeholder = placeholder
    self.content = content
  }

  /// Creates a TextArea with static text content.
  ///
  /// - Parameters:
  ///   - text: The default text content to display in the textarea.
  ///   - name: The name of the form control, as used in form submission.
  ///   - rows: The number of visible text lines for the control.
  ///   - columns: The expected maximum number of characters per line.
  ///   - placeholder: A hint to the user of what can be entered in the control.
  public init(
    _ text: String = "",
    name: String? = nil,
    rows: Int? = nil,
    columns: Int? = nil,
    placeholder: String? = nil
  ) where Content == DOMString {
    self.name = name
    self.rows = rows
    self.columns = columns
    self.placeholder = placeholder
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("textarea")

    if let name {
      try element.attr("name", name)
    }

    if let rows {
      try element.attr("rows", String(rows))
    }

    if let columns {
      try element.attr("cols", String(columns))
    }

    if let placeholder {
      try element.attr("placeholder", placeholder)
    }

    try self.content().render(element, environment: environment)
  }

  private let name: String?
  private let rows: Int?
  private let columns: Int?
  private let placeholder: String?
  @ViewBuilder private let content: @Sendable () -> Content
}
