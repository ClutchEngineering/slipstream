import SwiftSoup

/// Constants that control the behavior of a ``Button`` when it is activated.
///
/// - SeeAlso: W3C [button type](https://html.spec.whatwg.org/multipage/form-elements.html#attr-button-type) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum ButtonType: String {
  case submit
  case reset
}

/// A control that initiates an action.
///
/// - SeeAlso: W3C [button](https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Button<Label>: View where Label: View {
  /// Creates a button that displays a custom label and executes a custom action
  /// when clicked.
  public init(action: String, type: ButtonType? = nil, @ViewBuilder label: @escaping () -> Label) {
    self.label = label
    self.action = action
    self.type = type
  }

  /// Creates a button that displays a custom label.
  public init(type: ButtonType? = nil, @ViewBuilder label: @escaping () -> Label) {
    self.label = label
    self.action = nil
    self.type = type
  }

  /// Creates a button that generates its label from a string.
  public init(_ text: String, type: ButtonType? = nil) where Label == DOMString {
    self.label = {
      DOMString(text)
    }
    self.action = nil
    self.type = type
  }

  /// Creates a button that generates its label from a string and executes a custom
  /// action when clicked.
  public init(_ text: String, action: String, type: ButtonType? = nil) where Label == DOMString {
    self.label = {
      DOMString(text)
    }
    self.action = action
    self.type = type
  }

  @ViewBuilder private let label: () -> Label
  private let action: String?
  private let type: ButtonType?

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("button")
    if let action {
      try element.attr("onclick", action)
    }
    if let type {
      try element.attr("type", type.rawValue)
    }
    try self.label().render(element, environment: environment)
  }
}
