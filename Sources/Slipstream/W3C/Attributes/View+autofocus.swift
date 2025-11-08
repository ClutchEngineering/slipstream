extension View {
  /// Indicates that the element should be focused when the page loads.
  ///
  /// Only one element in the document should have the autofocus attribute. If applied
  /// to multiple elements, the first one in document order will receive focus.
  ///
  /// ```swift
  /// TextField("Search", type: .search)
  ///   .autofocus()
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element should
  ///   receive focus on page load. Defaults to true.
  ///
  /// - SeeAlso: W3C [`autofocus`](https://html.spec.whatwg.org/multipage/interaction.html#attr-fe-autofocus) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func autofocus(_ condition: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("autofocus", condition: condition))
  }
}
