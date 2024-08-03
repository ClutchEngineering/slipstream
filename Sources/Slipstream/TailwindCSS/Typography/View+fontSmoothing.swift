/// Constants that specify font smoothing.
///
/// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontSmoothing: String {
  case antialiased
  case subpixelAntialiased = "subpixel-antialiased"
}

extension View {
  /// Set the font smoothing for a view.
  ///
  /// - Parameter fontSmoothing: The font smoothing to apply to the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontSmoothing(_ fontSmoothing: FontSmoothing) -> some View {
    return modifier(ClassModifier(add: fontSmoothing.rawValue))
  }

  /// Set the font smoothing for a view to antialiased.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-smoothing`](https://tailwindcss.com/docs/font-smoothing) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func antialiased() -> some View {
    return fontSmoothing(.antialiased)
  }
}
