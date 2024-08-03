/// Constants that specify the size of the text.
///
/// - SeeAlso: Tailwind CSS' [`font-size`](https://tailwindcss.com/docs/font-size) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontSize: String {
  case extraSmall = "xs"
  case small = "sm"
  /// The default document font size.
  case base = "base"
  case large = "lg"
  case extraLarge = "xl"
  case extraExtraLarge = "2xl"
  case extraExtraExtraLarge = "3xl"
  case fourXLarge = "4xl"
  case fiveXLarge = "5xl"
  case sixXLarge = "6xl"
  case sevenXLarge = "7xl"
  case eightXLarge = "8xl"
  case nineXLarge = "9xl"
}

extension View {
  /// Set the font size.
  ///
  /// - Parameter fontSize: The font size to apply to the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-size`](https://tailwindcss.com/docs/font-size) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontSize(_ fontSize: FontSize) -> some View {
    return self.modifier(ClassModifier(add: "text-" + fontSize.rawValue))
  }
}

