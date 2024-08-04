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
      classNames.append("border" + classSuffix)
    } else if edges == [.horizontal] {
      classNames.append("border-x" + classSuffix)
    } else if edges == [.vertical] {
      classNames.append("border-y" + classSuffix)
    } else {
      if edges.contains(.top) {
        classNames.append("border-t" + classSuffix)
      }
      if edges.contains(.bottom) {
        classNames.append("border-b" + classSuffix)
      }
      if edges.contains(.left) {
        classNames.append("border-l" + classSuffix)
      }
      if edges.contains(.right) {
        classNames.append("border-r" + classSuffix)
      }
    }
    classNames.append("border-" + color.toTailwindColorClass())
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
