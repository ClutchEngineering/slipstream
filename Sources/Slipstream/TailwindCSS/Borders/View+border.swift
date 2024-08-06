extension View {
  /// Changes the border of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [`border color`](https://tailwindcss.com/docs/border-color) documentation.
  /// - SeeAlso: Tailwind CSS' [`border width`](https://tailwindcss.com/docs/border-width) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func border(_ color: Color, width: Int = 1, edges: Edge.Set = .all, condition: Condition? = nil) -> some View {
    let classSuffix = closestTailwindBorderWidth(width: width)
    var classNames: [String] = []
    if edges == .all {
      classNames.append(contentsOf: [
        "border" + classSuffix,
        "border-" + color.toTailwindColorClass()
      ])
    } else if edges == [.horizontal] {
      classNames.append(contentsOf: [
        "border-x" + classSuffix,
        "border-x-" + color.toTailwindColorClass()
      ])
    } else if edges == [.vertical] {
      classNames.append(contentsOf: [
        "border-y" + classSuffix,
        "border-y-" + color.toTailwindColorClass()
      ])
    } else {
      if edges.contains(.top) {
        classNames.append(contentsOf: [
          "border-t" + classSuffix,
          "border-t-" + color.toTailwindColorClass()
        ])
      }
      if edges.contains(.bottom) {
        classNames.append(contentsOf: [
          "border-b" + classSuffix,
          "border-b-" + color.toTailwindColorClass()
        ])
      }
      if edges.contains(.left) {
        classNames.append(contentsOf: [
          "border-l" + classSuffix,
          "border-l-" + color.toTailwindColorClass()
        ])
      }
      if edges.contains(.right) {
        classNames.append(contentsOf: [
          "border-r" + classSuffix,
          "border-r-" + color.toTailwindColorClass()
        ])
      }
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  private func closestTailwindBorderWidth(width: Int) -> String {
    // Mapping of Tailwind CSS font size classes to their point sizes.
    let borderMapping: [(classSuffix: String, width: Int)] = [
      ("-0", 0),
      ("", 1),
      ("-2", 2),
      ("-4", 4),
      ("-8", 8),
    ]
    // Find the closest matching font size
    let closest = borderMapping.min { abs($0.width - width) < abs($1.width - width) }
    return closest?.classSuffix ?? ""
  }
}
