extension View {
  /// Specifies whether the element may be checked for spelling errors.
  ///
  /// The spellcheck attribute is an enumerated attribute that defines whether the element
  /// may be checked for spelling errors. It can have true or false values.
  ///
  /// ```swift
  /// TextField("Comment", type: .text)
  ///   .spellcheck(true)
  /// ```
  ///
  /// - Parameter enabled: A Boolean value that determines whether spell checking is enabled.
  ///
  /// - SeeAlso: W3C [`spellcheck`](https://html.spec.whatwg.org/multipage/interaction.html#attr-spellcheck) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func spellcheck(_ enabled: Bool) -> some View {
    return modifier(AttributeModifier(.spellcheck, value: enabled ? "true" : "false"))
  }
}
