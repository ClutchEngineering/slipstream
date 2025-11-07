extension View {
  /// Controls whether browser-provided writing suggestions should be offered to the user.
  ///
  /// The writingsuggestions attribute is used to control whether the browser should provide
  /// writing suggestions (such as grammar or spelling corrections) for editable content.
  ///
  /// ```swift
  /// TextField("Email", type: .email)
  ///   .writingSuggestions(false)
  /// ```
  ///
  /// - Parameter enabled: A Boolean value that determines whether writing suggestions should be offered.
  ///
  /// - SeeAlso: W3C [`writingsuggestions`](https://html.spec.whatwg.org/multipage/interaction.html#attr-writingsuggestions) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func writingSuggestions(_ enabled: Bool) -> some View {
    return modifier(AttributeModifier(.writingsuggestions, value: enabled ? "true" : "false"))
  }
}
