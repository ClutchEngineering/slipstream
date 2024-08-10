import SwiftSoup

/// A control that initiates an action.
///
/// - SeeAlso: W3C [button](https://html.spec.whatwg.org/multipage/form-elements.html#the-button-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Button<Content>: View where Content: View {
  /// Creates a button that displays a custom label.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a button that generates its label from a string.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("button")
    try self.content().render(element, environment: environment)
  }
}
