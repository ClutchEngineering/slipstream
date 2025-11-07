extension View {
  /// Assigns a slot in a shadow DOM shadow tree to an element.
  ///
  /// The slot attribute assigns a slot in a shadow DOM shadow tree to an element. An element
  /// with a slot attribute is assigned to the slot created by the <slot> element whose name
  /// attribute's value matches that slot attribute's value.
  ///
  /// ```swift
  /// Span("Header content")
  ///   .slot("header")
  /// ```
  ///
  /// - Parameter name: The name of the slot to assign the element to.
  ///
  /// - SeeAlso: W3C [`slot`](https://html.spec.whatwg.org/multipage/scripting.html#attr-slot) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func slot(_ name: String) -> some View {
    return modifier(AttributeModifier(.slot, value: name))
  }
}
