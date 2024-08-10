extension View {
  /// Sets the shadow of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [box shadow](https://tailwindcss.com/docs/box-shadow) documentation.
  /// - SeeAlso: Tailwind CSS' [box shadow color](https://tailwindcss.com/docs/box-shadow-color) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func shadow(
    color: Color? = nil,
    radius: Double? = nil,
    condition: Condition? = nil
  ) -> some View {
    var classNames: [String] = []
    if let color {
      classNames.append("shadow-\(color.toTailwindColorClass())")
    }
    if let radius {
      classNames.append("shadow" + Self.radiusToTailwindShadowClass(radius: radius))
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  /// Maps a shadow radius to the closest Tailwind CSS shadow class.
  ///
  /// - Parameter radius: The radius in points to be mapped.
  /// - Returns: The Tailwind CSS shadow class.
  private static func radiusToTailwindShadowClass(radius: Double) -> String {
    let mapping: [(name: String, radius: Double)] = [
      ("-sm", 2),
      ("", 3),
      ("-md", 6),
      ("-lg", 15),
      ("-xl", 25),
      ("-2xl", 50),
    ]
    let closestClass = mapping.min { abs($0.radius - radius) < abs($1.radius - radius) }
    return closestClass?.name ?? "0"
  }
}
