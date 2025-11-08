extension View {
  /// Controls whether the element and its descendants can receive user interaction.
  ///
  /// When set to `false`, the element is made inert and cannot be interacted with by the user.
  /// The element is also removed from the accessibility tree.
  ///
  /// ```swift
  /// Div {
  ///   Button("Click me") { }
  /// }
  /// .allowsHitTesting(false)
  /// ```
  ///
  /// - Parameter enabled: A Boolean value that determines whether the element can receive
  ///   user interaction. When `false`, the HTML `inert` attribute is set. Defaults to true.
  ///
  /// - SeeAlso: W3C [`inert`](https://html.spec.whatwg.org/multipage/interaction.html#the-inert-attribute) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func allowsHitTesting(_ enabled: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("inert", condition: !enabled))
  }
}
