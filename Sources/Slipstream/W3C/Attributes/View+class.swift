extension View {
  /// Adds a class to the element's `class` attribute.
  ///
  /// - Parameter className: If the class contains spaces, it will be split
  /// into separate class names using the spaces as delimiters.
  @available(iOS 17.0, macOS 14.0, *)
  public func className(_ className: String) -> some View {
    return modifier(ClassModifier(add: className))
  }

  /// Adds a set of classes to the element's `class` attribute.
  ///
  /// - Parameter classNames: If any class contains spaces, it will be split
  /// into separate class names using the spaces as delimiters.
  @available(iOS 17.0, macOS 14.0, *)
  public func classNames(_ classNames: Set<String>) -> some View {
    return modifier(ClassModifier(add: classNames))
  }
}
