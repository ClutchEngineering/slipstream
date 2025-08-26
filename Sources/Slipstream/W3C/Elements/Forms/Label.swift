import SwiftSoup

/// A control that represents a caption for an item in a user interface.
///
/// Labels are typically associated with form controls using the `htmlFor` method
/// to create semantic relationships between the label and the control.
///
/// ```swift
/// Label {
///     Text("☰")
///         .fontSize(.extraLarge)
/// }
/// .htmlFor("menu-toggle")
/// .modifier(ClassModifier(add: "cursor-pointer"))
/// ```
///
/// - SeeAlso: W3C [label](https://html.spec.whatwg.org/multipage/forms.html#the-label-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Label<Content>: View, Sendable where Content: View {
  /// Creates a label with custom content.
  ///
  /// - Parameters:
  ///   - htmlFor: The id of the form control that this label is associated with.
  ///   - content: A view builder that creates the label's content.
  public init(for htmlFor: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
    self.htmlFor = htmlFor
  }

  /// Creates a label with static text.
  ///
  /// - Parameters:
  ///   - text: The text content of the label.
  ///   - htmlFor: The id of the form control that this label is associated with.
  public init(_ text: String, for htmlFor: String? = nil) where Content == DOMString {
    self.init(for: htmlFor) {
      DOMString(text)
    }
  }

  /// Sets the form control that this label is associated with.
  ///
  /// - Parameter controlId: The id of the form control.
  /// - Returns: A new label with the specified form control association.
  public func htmlFor(_ controlId: String) -> Label<Content> {
    Label(for: controlId, content: content)
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("label")
    
    if let htmlFor {
      try element.attr("for", htmlFor)
    }
    
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let htmlFor: String?
}
