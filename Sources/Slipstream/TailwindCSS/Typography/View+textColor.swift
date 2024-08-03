extension View {
  /// Sets the text color.
  ///
  /// - SeeAlso: Tailwind CSS' [`text-color`](https://tailwindcss.com/docs/text-color) documentation.
  /// - SeeAlso: Tailwind CSS' [customizing colors](https://tailwindcss.com/docs/customizing-colors) article.
  @available(iOS 17.0, macOS 14.0, *)
  public func textColor(_ color: Color) -> some View {
    return modifier(ClassModifier(add: "text-" + color.toTailwindColorClass()))
  }

  /// Sets the text color to a specific Tailwind CSS palette.
  ///
  /// - Parameters:
  ///   - colorPalette: The Tailwind CSS color palette to use.
  ///   - darkness: The darkness bracket within the color palette to use.
  ///   Higher values are darker. 0 corresponds to white, 1000 to black.
  ///
  /// - SeeAlso: Tailwind CSS' [`text-color`](https://tailwindcss.com/docs/text-color) documentation.
  /// - SeeAlso: Tailwind CSS' [customizing colors](https://tailwindcss.com/docs/customizing-colors) article.
  @available(iOS 17.0, macOS 14.0, *)
  public func textColor(_ colorPalette: ColorPalette, darkness: Int) -> some View {
    textColor(Color(colorPalette, darkness: darkness))
  }
}
