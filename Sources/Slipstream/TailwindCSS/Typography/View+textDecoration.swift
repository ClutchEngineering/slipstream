/// Constants that specify decorations of text.
///
/// - SeeAlso: Tailwind CSS' [font decoration](https://tailwindcss.com/docs/text-decoration) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum TextDecoration: String {
  case underline = "underline"
  case overline = "overline"
  case lineThrough = "line-through"
  case none = "no-underline"
}

extension View {
  /// Sets the font decoration.
  ///
  /// - SeeAlso: Tailwind CSS' [font decoration](https://tailwindcss.com/docs/text-decoration) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func textDecoration(_ textDecoration: TextDecoration, color: Color? = nil, condition: Condition? = nil) -> some View {
    var classes: Set<String> = Set()
    classes.insert(textDecoration.rawValue)
    if let color {
      classes.insert("decoration-" + color.toTailwindColorClass())
    }
    return modifier(TailwindClassModifier(add: classes, condition: condition))
  }

  /// Underlines text contained within this view.
  ///
  /// - SeeAlso: Tailwind CSS' [font decoration](https://tailwindcss.com/docs/text-decoration) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func underline(color: Color? = nil, condition: Condition? = nil) -> some View {
    textDecoration(.underline, color: color, condition: condition)
  }

  /// Strikes through text contained within this view.
  ///
  /// - SeeAlso: Tailwind CSS' [font decoration](https://tailwindcss.com/docs/text-decoration) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func strikethrough(color: Color? = nil, condition: Condition? = nil) -> some View {
    textDecoration(.lineThrough, color: color, condition: condition)
  }
}
