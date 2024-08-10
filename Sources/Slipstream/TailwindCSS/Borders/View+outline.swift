/// Constants that specify the style of a view's outline.
///
/// - SeeAlso: Tailwind CSS' [outline style](https://tailwindcss.com/docs/outline-style) documentation.
public enum OutlineStyle: String {
  case none = "-none"
  case solid = ""
  case dashed = "-dashed"
  case dotted = "-dotted"
  case double = "-double"
}

extension View {
  /// Changes the outline of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [outline style](https://tailwindcss.com/docs/outline-style) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func outline(_ color: Color? = nil, width: Int = 1, condition: Condition? = nil) -> some View {
    var classNames: [String] = [
      "outline" + closestTailwindOutlineWidth(width: width)
    ]
    if let color {
      classNames.append("outline-" + color.toTailwindColorClass())
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  /// Changes the outline of the view.
  ///
  /// - SeeAlso: Tailwind CSS' [outline style](https://tailwindcss.com/docs/outline-style) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func outline(_ color: Color? = nil, width: Int = 1, style: OutlineStyle, condition: Condition? = nil) -> some View {
    var classNames: [String] = []
    if style != .none {
      classNames.append("outline" + closestTailwindOutlineWidth(width: width))
    }
    if let color {
      classNames.append("outline-" + color.toTailwindColorClass())
    }
    classNames.append("outline" + style.rawValue)
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  private func closestTailwindOutlineWidth(width: Int) -> String {
    let mapping: [(classSuffix: String, width: Int)] = [
      ("-0", 0),
      ("-1", 1),
      ("-2", 2),
      ("-4", 4),
      ("-8", 8),
    ]
    let closest = mapping.min { abs($0.width - width) < abs($1.width - width) }
    return closest?.classSuffix ?? ""
  }
}
