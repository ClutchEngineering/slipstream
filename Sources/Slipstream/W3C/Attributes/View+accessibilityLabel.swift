extension View {
  /// Provides equivalent content for those who cannot process images or
  /// who have image loading disabled.
  ///
  /// - SeeAlso: W3C [alt](https://html.spec.whatwg.org/multipage/images.html#alt) guidance.
  /// 
  /// ## See Also
  ///
  /// - ``Image``
  @available(iOS 17.0, macOS 14.0, *)
  public func accessibilityLabel(_ string: String) -> some View {
    modifier(AttributeModifier("alt", value: string))
  }
}
