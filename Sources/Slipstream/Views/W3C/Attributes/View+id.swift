extension View {
  /// Sets the element's unique identifier (ID).
  ///
  /// - Parameter identifier: There are no other restrictions
  /// on what form an ID can take; in particular, IDs can consist of just
  /// digits, start with a digit, start with an underscore, consist of just
  /// punctuation, etc.
  @available(iOS 17.0, macOS 14.0, *)
  public func id(_ identifier: String) -> some View {
    return modifier(AttributeModifier(.id, value: identifier))
  }
}
