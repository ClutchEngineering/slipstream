extension View {
  /// Sets the opacity of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [opacity](https://tailwindcss.com/docs/opacity) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func opacity(_ opacity: Double, condition: Condition? = nil
  ) -> some View {
    return modifier(TailwindClassModifier(
      add: "opacity-" + Self.opacityToTailwindOpacityClass(opacity: opacity),
      condition: condition)
    )
  }

  /// Maps an opacity to the closest Tailwind CSS opacity class.
  ///
  /// - Parameter opacity: The opacity to be mapped.
  /// - Returns: The Tailwind CSS opacity class.
  private static func opacityToTailwindOpacityClass(opacity: Double) -> String {
    let mapping: [(name: String, opacity: Double)] = [
      ("0",   0.00),
      ("5",   0.05),
      ("10",  0.10),
      ("15",  0.15),
      ("20",  0.20),
      ("25",  0.25),
      ("30",  0.30),
      ("35",  0.35),
      ("40",  0.40),
      ("45",  0.45),
      ("50",  0.50),
      ("55",  0.55),
      ("60",  0.60),
      ("65",  0.65),
      ("70",  0.70),
      ("75",  0.75),
      ("80",  0.80),
      ("85",  0.85),
      ("90",  0.90),
      ("95",  0.95),
      ("100",  1.00),
    ]
    let closestClass = mapping.min { abs($0.opacity - opacity) < abs($1.opacity - opacity) }
    return closestClass?.name ?? "0"
  }
}
