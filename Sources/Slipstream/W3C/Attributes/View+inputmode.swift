/// The keyboard type to display for text input.
@available(iOS 17.0, macOS 14.0, *)
public enum KeyboardType: String {
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

extension View {
  /// Sets the keyboard type for text input.
  ///
  /// The keyboardType modifier is particularly useful on mobile devices where the virtual
  /// keyboard can be customized based on the expected input type.
  ///
  /// ```swift
  /// TextField("Amount", type: .text)
  ///   .keyboardType(.decimal)
  /// ```
  ///
  /// - Parameter type: The keyboard type to display.
  ///
  /// - SeeAlso: W3C [`inputmode`](https://html.spec.whatwg.org/multipage/interaction.html#attr-inputmode) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func keyboardType(_ type: KeyboardType) -> some View {
    return modifier(AttributeModifier(.inputmode, value: type.rawValue))
  }
}
