extension View {
  /// Provides advisory information about the element.
  ///
  /// The title attribute is commonly used to provide a tooltip or
  /// expansion of abbreviated content.
  ///
  /// - SeeAlso: W3C [title](https://html.spec.whatwg.org/multipage/dom.html#the-title-attribute) specification.
  ///
  /// ## See Also
  ///
  /// - ``Abbreviation``
  @available(iOS 17.0, macOS 14.0, *)
  public func title(_ string: String) -> some View {
    modifier(AttributeModifier("title", value: string))
  }
}
