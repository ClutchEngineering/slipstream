extension View {
  /// Inverts all of the colors in a view so that each color displays as its complementary color.
  ///
  /// For example, blue converts to yellow, and white converts to black.
  ///
  /// - SeeAlso: Tailwind CSS' [invert](https://tailwindcss.com/docs/invert) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func colorInvert(condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "invert", condition: condition))
  }
}
