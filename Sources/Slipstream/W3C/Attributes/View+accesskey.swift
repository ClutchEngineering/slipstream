extension View {
  /// Specifies a keyboard shortcut to activate or focus the element.
  ///
  /// The accesskey attribute's value is used to generate a keyboard shortcut that
  /// activates or focuses the element. The exact behavior depends on the browser and platform.
  ///
  /// ```swift
  /// Button("Save") {
  ///   // Save action
  /// }
  /// .accesskey("s")
  /// ```
  ///
  /// - Parameter key: A single character that will be used as the keyboard shortcut.
  ///   The exact key combination varies by browser and platform (e.g., Alt+key on Windows,
  ///   Control+Option+key on macOS).
  ///
  /// - SeeAlso: W3C [`accesskey`](https://html.spec.whatwg.org/multipage/interaction.html#the-accesskey-attribute) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func accesskey(_ key: String) -> some View {
    return modifier(AttributeModifier(.accesskey, value: key))
  }
}
