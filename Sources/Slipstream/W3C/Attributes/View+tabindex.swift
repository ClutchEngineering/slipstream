extension View {
  /// Specifies whether the element can be focused and where it participates in sequential keyboard navigation.
  ///
  /// The tabindex attribute allows authors to control whether an element can be focused,
  /// whether it is supposed to be reachable using sequential focus navigation, and what
  /// is to be the relative order of the element for the purposes of sequential focus navigation.
  ///
  /// ```swift
  /// Div {
  ///   Text("Focusable content")
  /// }
  /// .focusable()
  /// ```
  ///
  /// - Parameter index: The tab index value. A negative value (typically -1) means the element
  ///   can be focused programmatically but not via sequential keyboard navigation. A value of 0
  ///   means the element can be focused and is reachable via sequential keyboard navigation,
  ///   in the order defined by the document. A positive value means the element can be focused
  ///   and is reachable via sequential keyboard navigation, with its order defined by the value.
  ///
  /// - SeeAlso: W3C [`tabindex`](https://html.spec.whatwg.org/multipage/interaction.html#attr-tabindex) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func tabIndex(_ index: Int) -> some View {
    return modifier(AttributeModifier(.tabindex, value: String(index)))
  }

  /// Makes the element focusable but not reachable via sequential keyboard navigation.
  ///
  /// This is a convenience method that sets tabindex to -1.
  @available(iOS 17.0, macOS 14.0, *)
  public func focusable() -> some View {
    return modifier(AttributeModifier(.tabindex, value: "-1"))
  }
}
