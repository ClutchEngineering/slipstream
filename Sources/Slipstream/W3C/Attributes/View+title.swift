extension View {
  /// Advisory information associated with the element.
  ///
  /// The title attribute represents advisory information for the element, such as would be
  /// appropriate for a tooltip. It can be used on any HTML element.
  ///
  /// ```swift
  /// Button("Save") { }
  ///   .tooltip("Save your changes")
  /// ```
  ///
  /// - Parameter text: The advisory information text.
  ///
  /// - SeeAlso: W3C [`title`](https://html.spec.whatwg.org/multipage/dom.html#attr-title) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func tooltip(_ text: String) -> some View {
    return modifier(AttributeModifier(.title, value: text))
  }
}
