/// The contenteditable attribute indicates whether the element's content is editable.
@available(iOS 17.0, macOS 14.0, *)
public enum Contenteditable: String {
  /// The element is editable.
  case `true`
  /// The element is not editable.
  case `false`
  /// The element inherits the contenteditable state from its parent.
  case inherit = "inherit"
}

extension View {
  /// Indicates whether the element's content is editable.
  ///
  /// The contenteditable attribute makes an element's content editable by the user.
  /// This is commonly used to create rich text editors and inline editing experiences.
  ///
  /// ```swift
  /// Div {
  ///   Text("Edit this text")
  /// }
  /// .contenteditable(.true)
  /// ```
  ///
  /// - Parameter value: The editability state of the element.
  ///
  /// - SeeAlso: W3C [`contenteditable`](https://html.spec.whatwg.org/multipage/interaction.html#attr-contenteditable) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func contenteditable(_ value: Contenteditable) -> some View {
    return modifier(AttributeModifier(.contenteditable, value: value.rawValue))
  }

  /// Indicates whether the element's content is editable.
  ///
  /// - Parameter condition: A Boolean value that determines whether the element is editable.
  @available(iOS 17.0, macOS 14.0, *)
  public func contenteditable(_ condition: Bool) -> some View {
    return modifier(AttributeModifier(.contenteditable, value: condition ? "true" : "false"))
  }
}
