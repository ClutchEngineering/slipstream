/// The hidden attribute indicates that the element is not yet, or is no longer, relevant.
@available(iOS 17.0, macOS 14.0, *)
public enum HiddenState: String {
  /// The element is hidden in all rendering modes.
  case hidden = ""
  /// The element is hidden but remains in the accessibility tree until it is found.
  case untilFound = "until-found"
}

extension View {
  /// Indicates that the element is not yet, or is no longer, relevant.
  ///
  /// Sets the HTML `hidden` attribute to semantically mark content as not relevant.
  /// This is different from the TailwindCSS `hidden()` modifier which uses CSS to
  /// visually hide elements.
  ///
  /// ```swift
  /// Div {
  ///   Text("This content is hidden")
  /// }
  /// .hidden(.hidden)
  /// ```
  ///
  /// - Parameter state: The hidden state of the element.
  ///
  /// - SeeAlso: W3C [`hidden`](https://html.spec.whatwg.org/multipage/interaction.html#attr-hidden) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func hidden(_ state: HiddenState) -> some View {
    return modifier(AttributeModifier(.hidden, value: state.rawValue))
  }
}

