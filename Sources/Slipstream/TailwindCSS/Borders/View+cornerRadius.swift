/// Constants that specify the corner radius of the view.
///
/// - SeeAlso: Tailwind CSS' [border radius](https://tailwindcss.com/docs/border-radius) documentation.
public enum CornerRadius: String {
  case none = "-none"
  case small = "-sm"
  case base = ""
  case medium = "-md"
  case large = "-lg"
  case extraLarge = "-xl"
  case extraExtraLarge = "-2xl"
  case extraExtraExtraLarge = "-3xl"
  case full = "-full"
}

extension View {
  /// Changes the corner radius of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [border radius](https://tailwindcss.com/docs/border-radius) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func cornerRadius(_ radius: CornerRadius, condition: Condition? = nil) -> some View {
    return self.modifier(TailwindClassModifier(add: "rounded" + radius.rawValue, condition: condition))
  }

  /// Set the font corner radius to the closest equivalent Tailwind CSS radius size.
  ///
  /// - Parameters:
  ///   - ptSize: A corner size in `pt` units. The closest Tailwind corner
  ///   size class that matches this point size will be used. If the size is exactly between
  ///   two classes, then the smaller of the two will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font-size`](https://tailwindcss.com/docs/font-size) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func cornerRadius(_ ptSize: Int, condition: Condition? = nil) -> some View {
    return cornerRadius(closestTailwindCornerRadius(ptSize: ptSize), condition: condition)
  }

  private func closestTailwindCornerRadius(ptSize: Int) -> CornerRadius {
    let mapping: [(cornerRadius: CornerRadius, ptSize: Int)] = [
      (.none, 0),
      (.small, 2),                 // 0.125rem
      (.base, 4),                  // 0.25rem
      (.medium, 6),                // 0.375rem
      (.large, 8),                 // 0.5rem
      (.extraLarge, 12),           // 0.75rem
      (.extraExtraLarge, 16),      // 1rem
      (.extraExtraExtraLarge, 24), // 1.5rem
    ]
    let closest = mapping.min { abs($0.ptSize - ptSize) < abs($1.ptSize - ptSize) }
    return closest?.cornerRadius ?? .none
  }
}
