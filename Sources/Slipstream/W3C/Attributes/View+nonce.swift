extension View {
  /// A cryptographic nonce ("number used once") used by Content Security Policy.
  ///
  /// The nonce attribute represents a cryptographic nonce ("number used once") which can
  /// be used by Content Security Policy to determine whether or not a given fetch will be
  /// allowed to proceed. The value is text.
  ///
  /// ```swift
  /// Script("""
  ///   console.log("Hello");
  /// """)
  /// .nonce("randomNonceValue123")
  /// ```
  ///
  /// - Parameter value: A cryptographic nonce value.
  ///
  /// - SeeAlso: W3C [`nonce`](https://html.spec.whatwg.org/multipage/urls-and-fetching.html#attr-nonce) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func nonce(_ value: String) -> some View {
    return modifier(AttributeModifier(.nonce, value: value))
  }
}
