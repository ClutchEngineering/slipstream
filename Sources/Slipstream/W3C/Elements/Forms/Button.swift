import SwiftSoup

/// A control that initiates an action.
///
/// - SeeAlso: W3C [button](https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Button<Label>: View where Label: View {
  /// Creates a button that displays a custom label and executes a custom action
  /// when clicked.
  public init(action: String, @ViewBuilder label: @escaping () -> Label) {
    self.label = label
    self.action = action
  }

  /// Creates a button that displays a custom label.
  public init(@ViewBuilder label: @escaping () -> Label) {
    self.label = label
    self.action = nil
  }

  /// Creates a button that generates its label from a string.
  public init(_ text: String) where Label == DOMString {
    self.label = {
      DOMString(text)
    }
    self.action = nil
  }

  /// Creates a button that generates its label from a string and executes a custom
  /// action when clicked.
  public init(_ text: String, action: String) where Label == DOMString {
    self.label = {
      DOMString(text)
    }
    self.action = action
  }

  @ViewBuilder private let label: () -> Label
  private let action: String?

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("button")
    if let action {
      try element.attr("onclick", action)
    }
    try self.label().render(element, environment: environment)
  }
}
