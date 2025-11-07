/// The dir attribute specifies the element's text directionality.
@available(iOS 17.0, macOS 14.0, *)
public enum TextDirection: String {
  /// Left-to-right text direction.
  case ltr
  /// Right-to-left text direction.
  case rtl
  /// Automatic text direction based on content.
  case auto
}

extension View {
  /// Specifies the element's text directionality.
  ///
  /// The dir attribute controls the direction in which text is rendered. This is
  /// particularly important for languages like Arabic and Hebrew that are written
  /// right-to-left.
  ///
  /// ```swift
  /// Div {
  ///   Text("مرحبا بك")
  /// }
  /// .direction(.rtl)
  /// ```
  ///
  /// - Parameter direction: The text direction for the element.
  ///
  /// - SeeAlso: W3C [`dir`](https://html.spec.whatwg.org/multipage/dom.html#attr-dir) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func direction(_ direction: TextDirection) -> some View {
    return modifier(AttributeModifier(.dir, value: direction.rawValue))
  }
}
