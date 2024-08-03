/// Constants that specify the visual alignment of the text.
@available(iOS 17.0, macOS 14.0, *)
public enum TextAlignment: String {
  /// Aligns text to the left edge of the text container.
  case left = "left"

  /// Aligns text to the left edge of the text container in
  /// left-to-right (LTR) languages, and to the right edge
  /// in right-to-left (RTL) languages..
  case leading = "start"

  /// Aligns text to the center of the text container.
  case center

  /// Aligns text to the right edge of the text container.
  case right = "right"

  /// Aligns text to the right edge of the text container in
  /// left-to-right (LTR) languages, and to the left edge
  /// in right-to-left (RTL) languages..
  case trailing = "end"

  /// Text will fill the container, adding spacing between words as needed.
  case justify
}

extension View {
  /// Controls the alignment of text.
  ///
  /// - Parameter alignment: Text alignment to be applied to text within the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [`text-align`](https://tailwindcss.com/docs/text-align) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func textAlignment(_ alignment: TextAlignment) -> some View {
    return modifier(ClassModifier(add: "text-" + alignment.rawValue))
  }
}
