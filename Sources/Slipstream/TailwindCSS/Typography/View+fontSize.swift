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

  /// Set the font size to the closest equivalent Tailwind CSS font size.
  ///
  /// - Parameter fontSize: A font size in `pt` units. if the size is exactly between
  /// two font classes, then the smaler font will be used.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-size`](https://tailwindcss.com/docs/font-size) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontSize(_ ptSize: Int) -> some View {
    return fontSize(closestTailwindFontSize(ptSize: ptSize))
  }

  private func closestTailwindFontSize(ptSize: Int) -> FontSize {
    // Mapping of Tailwind CSS font size classes to their point sizes.
    let fontSizeMapping: [(fontSize: FontSize, ptSize: Int)] = [
      (.extraSmall, 12),            // 0.75rem (12pt)
      (.small, 14),                 // 0.875rem (14pt)
      (.base, 16),                  // 1rem (16pt)
      (.large, 18),                 // 1.125rem (18pt)
      (.extraLarge, 20),            // 1.25rem (20pt)
      (.extraExtraLarge, 24),       // 1.5rem (24pt)
      (.extraExtraExtraLarge, 30),  // 1.875rem (30pt)
      (.fourXLarge, 36),            // 2.25rem (36pt)
      (.fiveXLarge, 48),            // 3rem (48pt)
      (.sixXLarge, 60),             // 3.75rem (60pt)
      (.sevenXLarge, 72),           // 4.5rem (72pt)
      (.eightXLarge, 96),           // 6rem (96pt)
      (.nineXLarge, 128)            // 8rem (128pt)
    ]
    // Find the closest matching font size
    let closestFontSize = fontSizeMapping.min { abs($0.ptSize - ptSize) < abs($1.ptSize - ptSize) }
    return closestFontSize?.fontSize ?? .base
  }
}
