/// Constants that specify the font leading (line height) of the text.
///
/// - SeeAlso: Tailwind CSS' [line-height](https://tailwindcss.com/docs/line-height) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontLeading: String {
  case none
  case tight
  case snug
  case normal
  case relaxed
  case loose
}

extension View {
  /// Sets the font leading (line height).
  ///
  /// - Parameters:
  ///   - fontLeading: The font leading to apply to the modified view.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [line height](https://tailwindcss.com/docs/line-height) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontLeading(_ fontLeading: FontLeading, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: "leading-" + fontLeading.rawValue, condition: condition)
    )
  }

  /// Sets the font leading (line height) to a specific size.
  ///
  /// - Parameters:
  ///   - fontLeading: The font leading to apply (in points) to the modified view. The closest Tailwind
  ///   font leading class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [line height](https://tailwindcss.com/docs/line-height) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontLeading(_ fontLeading: Double, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: "leading-" + closestTailwindFontLeading(ptSize: fontLeading), condition: condition)
    )
  }

  private func closestTailwindFontLeading(ptSize: Double) -> String {
    let mapping: [(classSuffix: String, ptSize: Double)] = [
      ("none", 0),
      ("3", 12),    // 0.75rem
      ("4", 16),    // 1rem
      ("5", 20),    // 1.25rem
      ("6", 24),    // 1.5rem
      ("7", 28),    // 1.75rem
      ("8", 32),    // 2rem
      ("9", 36),    // 2.25rem
      ("10", 40),   // 2.5rem
    ]
    let closest = mapping.min { abs($0.ptSize - ptSize) < abs($1.ptSize - ptSize) }
    return closest?.classSuffix ?? "3"
  }
}
