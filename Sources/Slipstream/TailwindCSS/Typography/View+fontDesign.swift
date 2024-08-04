/// Constants that specify the font design of the text.
///
/// - SeeAlso: Tailwind CSS' [`font-size`](https://tailwindcss.com/docs/font-size) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FontDesign: String {
  case sans
  case serif
  case mono
}

extension View {
  /// Sets the font design.
  ///
  /// - Parameters:
  ///   - fontDesign: The font design to apply to the modified view.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font family`](https://tailwindcss.com/docs/font-family) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontDesign(_ fontDesign: FontDesign, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: "font-" + fontDesign.rawValue, condition: condition)
    )
  }

  /// Sets the font design to a custom font.
  ///
  /// The given font design must be registered in your `tailwind.config.js` file.
  /// An example of a `rounded` font being registered:
  ///
  /// ```javascript
  /// /** @type {import('tailwindcss').Config} */
  /// module.exports = {
  ///   content: ["./**/*.html"],
  ///   theme: {
  ///     fontFamily: {
  ///       'rounded': ['ui-rounded', '-apple-system', 'system-ui', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', '"Helvetica Neue"', 'Arial', 'sans-serif']
  ///     },
  ///   }
  /// }
  /// ```
  ///
  /// You can then use the font like so:
  ///
  /// ```swift
  /// struct MySiteContent: View {
  ///   var body: some View {
  ///     Div {
  ///       Text("Hello,")
  ///     }
  ///     .fontDesign("rounded")
  ///   }
  /// }
  /// ```
  ///
  /// - Parameters:
  ///   - fontDesign: The font design to apply to the modified view.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`font family`](https://tailwindcss.com/docs/font-family) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func fontDesign(_ fontDesign: String, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(add: "font-" + fontDesign, condition: condition)
    )
  }
}
