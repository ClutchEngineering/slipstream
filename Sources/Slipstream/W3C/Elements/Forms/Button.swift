import SwiftSoup

/// Constants that control the behavior of a ``Button`` when it is activated.
///
/// - SeeAlso: W3C [button type](https://html.spec.whatwg.org/multipage/form-elements.html#attr-button-type) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum ButtonType: String, Sendable {
  case submit
  case reset
}

/// A control that initiates an action.
///
/// - SeeAlso: W3C [button](https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Button<Label>: View, Sendable
where Label: View {
  /// Creates a button that displays a custom label and executes a custom action
  /// when clicked.
  public init(action: String, type: ButtonType? = nil, name: String? = nil, @ViewBuilder label: @escaping @Sendable () -> Label) {
    self.label = label
    self.action = action
    self.type = type
    self.name = name
  }

  /// Creates a button that displays a custom label.
  public init(type: ButtonType? = nil, name: String? = nil, @ViewBuilder label: @escaping @Sendable () -> Label) {
    self.label = label
    self.action = nil
    self.type = type
    self.name = name
  }

  /// Creates a button that generates its label from a string.
  public init(_ text: String, type: ButtonType? = nil, name: String? = nil) where Label == DOMString {
    self.init(type: type, name: name) {
      DOMString(text)
    }
  }

  /// Creates a button that generates its label from a string and executes a custom
  /// action when clicked.
  public init(_ text: String, action: String, type: ButtonType? = nil, name: String? = nil) where Label == DOMString {
    self.init(action: action, type: type, name: name) {
      DOMString(text)
    }
  }

  @ViewBuilder private let label: @Sendable () -> Label
  private let action: String?
  private let type: ButtonType?
  private let name: String?

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("button")
    if let action {
      try element.attr("onclick", action)
    }
    if let type {
      try element.attr("type", type.rawValue)
    }
    if let name {
      try element.attr("name", name)
    }
    try self.label().render(element, environment: environment)
  }
}
