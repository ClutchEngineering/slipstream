import Foundation

/// Represents a placeholder inside a web component that you can fill with your own markup.
///
/// Slots are part of the Web Components technology suite and enable creating reusable
/// custom elements with flexible content insertion points.
///
/// ```swift
/// Slot(name: "header") {
///   H2("Default Header")
/// }
/// ```
///
/// - SeeAlso: W3C [slot](https://html.spec.whatwg.org/multipage/scripting.html#the-slot-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Slot<Content>: View where Content: View {
  /// Creates a Slot view.
  ///
  /// - Parameters:
  ///   - name: The name of the slot. Used to assign content to specific slots in a web component.
  ///   - content: The fallback content to display if no content is provided to the slot.
  public init(name: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.name = name
    self.content = content
  }

  /// Creates a Slot view with static text.
  ///
  /// - Parameters:
  ///   - text: The fallback text to display if no content is provided to the slot.
  ///   - name: The name of the slot.
  public init(_ text: String, name: String? = nil) where Content == DOMString {
    self.name = name
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("slot")

    if let name {
      try element.attr("name", name)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let name: String?
}
