extension View {
  /// Specifies that a custom element should be an instance of the specified custom element type.
  ///
  /// The is attribute is used with customized built-in elements to specify the name of the
  /// custom element class that the element should be treated as. This allows you to extend
  /// standard HTML elements with custom behavior.
  ///
  /// ```swift
  /// Button("Click") { }
  ///   .customElement("expanding-button")
  /// ```
  ///
  /// - Parameter name: The name of the custom element class.
  ///
  /// - SeeAlso: W3C [`is`](https://html.spec.whatwg.org/multipage/custom-elements.html#attr-is) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func customElement(_ name: String) -> some View {
    return modifier(AttributeModifier(.is, value: name))
  }
}
