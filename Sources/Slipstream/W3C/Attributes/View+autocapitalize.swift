extension View {
  /// The autocapitalize attribute controls whether and how text input is automatically capitalized.
  public enum Autocapitalize: String {
    /// No automatic capitalization.
    case none
    /// Capitalize the first letter of each sentence.
    case sentences
    /// Capitalize the first letter of each word.
    case words
    /// Capitalize all characters.
    case characters
  }

  /// Controls whether and how text input is automatically capitalized.
  ///
  /// The autocapitalize attribute is particularly useful for mobile devices where the system
  /// keyboard can automatically capitalize text based on the specified behavior.
  ///
  /// ```swift
  /// TextField("Name", type: .text)
  ///   .autocapitalize(.words)
  /// ```
  ///
  /// - Parameter mode: The autocapitalization behavior to apply.
  ///
  /// - SeeAlso: W3C [`autocapitalize`](https://html.spec.whatwg.org/multipage/interaction.html#attr-autocapitalize) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func autocapitalize(_ mode: Autocapitalize) -> some View {
    return modifier(AttributeModifier(.autocapitalize, value: mode.rawValue))
  }
}
