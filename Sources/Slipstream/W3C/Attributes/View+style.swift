extension View {
  /// Contains CSS styling declarations to be applied to the element.
  ///
  /// The style attribute contains CSS declarations that are applied to the element.
  /// This allows for inline styling of elements.
  ///
  /// ```swift
  /// Div {
  ///   Text("Styled text")
  /// }
  /// .inlineStyle("color: red; font-weight: bold;")
  /// ```
  ///
  /// - Parameter css: A string containing CSS declarations.
  ///
  /// - SeeAlso: W3C [`style`](https://html.spec.whatwg.org/multipage/dom.html#attr-style) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func inlineStyle(_ css: String) -> some View {
    return modifier(AttributeModifier(.style, value: css))
  }
}
