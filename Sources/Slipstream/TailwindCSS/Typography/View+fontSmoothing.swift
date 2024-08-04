/// Constants that specify font smoothing.
///
/// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontSmoothing: String {
  case antialiased
  case subpixelAntialiased = "subpixel-antialiased"
}

extension View {
  /// Sets the font smoothing for a view.
  ///
  /// - Parameters:
  ///   - fontSmoothing: The font smoothing to apply to the modified view.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontSmoothing(_ fontSmoothing: FontSmoothing, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: fontSmoothing.rawValue, condition: condition)
    )
  }

  /// Sets the font smoothing for a view to antialiased.
  ///
  /// - Parameters:
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func antialiased(condition: Condition? = nil) -> some View {
    return fontSmoothing(.antialiased, condition: condition)
  }
}
