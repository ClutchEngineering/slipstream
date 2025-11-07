extension View {
  /// Indicates that the element and its descendants should be made non-interactive.
  ///
  /// The inert attribute is a boolean attribute that indicates that the element is to
  /// be made inert. When a node is inert, it cannot be interacted with by the user, and
  /// it is removed from the accessibility tree.
  ///
  /// ```swift
  /// Div {
  ///   Button("Click me") { }
  /// }
  /// .inert()
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element is inert.
  ///   Defaults to true.
  ///
  /// - SeeAlso: W3C [`inert`](https://html.spec.whatwg.org/multipage/interaction.html#the-inert-attribute) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func inert(_ condition: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("inert", condition: condition))
  }
}
