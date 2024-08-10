extension View {
  /// Changes the ring of the view using a CSS box-shadow.
  ///
  /// - SeeAlso: Tailwind CSS' [ring width](https://tailwindcss.com/docs/ring-width) documentation.
  /// - SeeAlso: Tailwind CSS' [ring color](https://tailwindcss.com/docs/ring-color) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func ring(_ color: Color? = nil, width: Int = 1, condition: Condition? = nil) -> some View {
    var classNames: [String] = [
      "ring" + closestTailwindRingWidth(width: width)
    ]
    if let color {
      classNames.append("ring-" + color.toTailwindColorClass())
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  private func closestTailwindRingWidth(width: Int) -> String {
    let mapping: [(classSuffix: String, width: Int)] = [
      ("-0", 0),
      ("-1", 1),
      ("-2", 2),
      ("", 3),
      ("-4", 4),
      ("-8", 8),
    ]
    let closest = mapping.min { abs($0.width - width) < abs($1.width - width) }
    return closest?.classSuffix ?? ""
  }
}
