extension View {
  /// Indicates whether the element can be dragged.
  ///
  /// The draggable attribute controls whether an element can be dragged using the
  /// HTML Drag and Drop API. This is commonly used for implementing drag-and-drop
  /// interfaces.
  ///
  /// ```swift
  /// Div {
  ///   Text("Drag me")
  /// }
  /// .draggable()
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element can be dragged.
  ///   Defaults to true.
  ///
  /// - SeeAlso: W3C [`draggable`](https://html.spec.whatwg.org/multipage/dnd.html#attr-draggable) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func draggable(_ condition: Bool = true) -> some View {
    return modifier(AttributeModifier(.draggable, value: condition ? "true" : "false"))
  }
}
