/// Constants that specify the weight of the text.
///
/// - SeeAlso: Tailwind CSS' [font weight](https://tailwindcss.com/docs/font-weight) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontWeight: String {
  case ultralight = "thin"
  case thin = "extralight"
  case light
  case regular = "normal"
  case medium
  case semibold = "semibold"
  case bold
  case heavy = "extrabold"
  case black
}

extension View {
  /// Sets the font weight.
  ///
  /// - Parameters:
  ///   - fontWeight: The font weight to apply to the modified view.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontWeight(_ fontWeight: FontWeight, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "font-" + fontWeight.rawValue, condition: condition))
  }

  /// Sets the font weight to the closest equivalent Tailwind CSS font weight.
  ///
  /// - Parameters:
  ///   - weight: A font weight value. The closest Tailwind font
  ///   weight class that matches this weight will be used. If the weight is exactly between
  ///   two weight classes, then the lighter weight will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontWeight(_ weight: Int, condition: Condition? = nil) -> some View {
    return fontWeight(closestTailwindFontWeight(weight: weight), condition: condition)
  }

  /// Sets the font weight to bold.
  ///
  /// - Parameters:
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-weight`](https://tailwindcss.com/docs/font-weight) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func bold(condition: Condition? = nil) -> some View {
    return fontWeight(.bold, condition: condition)
  }

  private func closestTailwindFontWeight(weight: Int) -> FontWeight {
    // Mapping of Tailwind CSS font weight classes to their weight values.
    let fontWeightMapping: [(fontWeight: FontWeight, weight: Int)] = [
      (.ultralight, 100),   // Thin
      (.thin, 200),         // Extra Light
      (.light, 300),        // Light
      (.regular, 400),      // Normal
      (.medium, 500),       // Medium
      (.semibold, 600),     // Semi Bold
      (.bold, 700),         // Bold
      (.heavy, 800),        // Extra Bold
      (.black, 900)         // Black
    ]
    // Find the closest matching font weight
    let closestFontWeight = fontWeightMapping.min { abs($0.weight - weight) < abs($1.weight - weight) }
    return closestFontWeight?.fontWeight ?? .regular
  }
}
