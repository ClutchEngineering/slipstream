extension View {
  /// The inputmode attribute hints at the type of data that might be entered by the user
  /// while editing the element.
  public enum InputMode: String {
    /// No virtual keyboard. For when the page implements its own keyboard input control.
    case none
    /// Standard input keyboard for the user's current locale.
    case text
    /// Fractional numeric input keyboard containing the digits and decimal separator for the
    /// user's locale (typically . or ,). Devices may or may not show a minus key (-).
    case decimal
    /// Numeric input keyboard, but only requires the digits 0-9. Devices may or may not show
    /// a minus key.
    case numeric
    /// A telephone keypad input, including the digits 0-9, the asterisk (*), and the pound (#) key.
    case tel
    /// A virtual keyboard optimized for search input.
    case search
    /// A virtual keyboard optimized for entering email addresses.
    case email
    /// A keypad optimized for entering URLs.
    case url
  }

  /// Hints at the type of data that might be entered by the user while editing the element.
  ///
  /// The inputmode attribute is particularly useful on mobile devices where the virtual
  /// keyboard can be customized based on the expected input type.
  ///
  /// ```swift
  /// TextField("Amount", type: .text)
  ///   .inputMode(.decimal)
  /// ```
  ///
  /// - Parameter mode: The input mode hint for the element.
  ///
  /// - SeeAlso: W3C [`inputmode`](https://html.spec.whatwg.org/multipage/interaction.html#attr-inputmode) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func inputMode(_ mode: InputMode) -> some View {
    return modifier(AttributeModifier(.inputmode, value: mode.rawValue))
  }
}
