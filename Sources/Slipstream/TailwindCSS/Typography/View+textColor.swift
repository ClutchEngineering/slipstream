extension View {
  /// Sets the text color.
  ///
  /// - Parameters:
  ///   - color: The color to use. 
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`text-color`](https://tailwindcss.com/docs/text-color) documentation.
  /// - SeeAlso: Tailwind CSS' [customizing colors](https://tailwindcss.com/docs/customizing-colors) article.
  @available(iOS 17.0, macOS 14.0, *)
  public func textColor(_ color: Color, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: "text-" + color.toTailwindColorClass(), condition: condition)
    )
  }

  /// Sets the text color to a specific Tailwind CSS palette.
  ///
  /// - Parameters:
  ///   - colorPalette: The Tailwind CSS color palette to use.
  ///   - darkness: The darkness bracket within the color palette to use.
  ///   Higher values are darker. 0 corresponds to white, 1000 to black.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`text-color`](https://tailwindcss.com/docs/text-color) documentation.
  /// - SeeAlso: Tailwind CSS' [customizing colors](https://tailwindcss.com/docs/customizing-colors) article.
  @available(iOS 17.0, macOS 14.0, *)
  public func textColor(_ colorPalette: ColorPalette, darkness: Int, condition: Condition? = nil) -> some View {
    textColor(Color(colorPalette, darkness: darkness), condition: condition)
  }
}
