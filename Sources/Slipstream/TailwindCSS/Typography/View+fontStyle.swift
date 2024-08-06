/// Constants that control the style of text.
///
/// - SeeAlso: Tailwind CSS' [font style](https://tailwindcss.com/docs/font-style) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontStyle: String {
  case italic = "italic"
  case notItalic = "not-italic"
}

extension View {
  /// Sets the font style.
  ///
  /// - SeeAlso: Tailwind CSS' [font style](https://tailwindcss.com/docs/font-style) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontStyle(_ fontStyle: FontStyle, condition: Condition? = nil) -> some View {
    modifier(TailwindClassModifier(add: fontStyle.rawValue, condition: condition))
  }

  /// Italicizes the text.
  ///
  /// - SeeAlso: Tailwind CSS' [font style](https://tailwindcss.com/docs/font-style) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func italic(isActive: Bool = true, condition: Condition? = nil) -> some View {
    fontStyle(isActive ? .italic : .notItalic, condition: condition)
  }
}
