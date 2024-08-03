/// Constants that specify the weight of the text.
///
/// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontWeight: String {
  case thin
  case extraLight = "extralight"
  case light
  case normal
  case medium
  case semiBold = "semibold"
  case bold
  case extraBold = "extrabold"
  case black
}

extension View {
  /// Sets the font weight.
  ///
  /// - Parameter fontWeight: The font weight to apply to the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontWeight(_ fontWeight: FontWeight) -> some View {
    return modifier(ClassModifier(add: "font-" + fontWeight.rawValue))
  }

  /// Sets the font weight to the closest equivalent Tailwind CSS font weight.
  ///
  /// - Parameter weight: A font weight value. The closest Tailwind font
  /// weight class that matches this weight will be used. If the weight is exactly between
  /// two weight classes, then the lighter weight will be used.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontWeight(_ weight: Int) -> some View {
    return fontWeight(closestTailwindFontWeight(weight: weight))
  }

  /// Sets the font weight to bold.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func bold() -> some View {
    return fontWeight(.bold)
  }

  private func closestTailwindFontWeight(weight: Int) -> FontWeight {
    // Mapping of Tailwind CSS font weight classes to their weight values.
    let fontWeightMapping: [(fontWeight: FontWeight, weight: Int)] = [
      (.thin, 100),        // Thin
      (.extraLight, 200),  // Extra Light
      (.light, 300),       // Light
      (.normal, 400),      // Normal
      (.medium, 500),      // Medium
      (.semiBold, 600),    // Semi Bold
      (.bold, 700),        // Bold
      (.extraBold, 800),   // Extra Bold
      (.black, 900)        // Black
    ]
    // Find the closest matching font weight
    let closestFontWeight = fontWeightMapping.min { abs($0.weight - weight) < abs($1.weight - weight) }
    return closestFontWeight?.fontWeight ?? .normal
  }
}
