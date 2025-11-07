extension View {
  /// The hidden attribute indicates that the element is not yet, or is no longer, relevant.
  public enum HiddenState: String {
    /// The element is hidden in all rendering modes.
    case hidden = ""
    /// The element is hidden but remains in the accessibility tree until it is found.
    case untilFound = "until-found"
  }

  /// Indicates that the element is not yet, or is no longer, relevant.
  ///
  /// The hidden attribute is a boolean attribute that indicates that the element is
  /// not relevant to the current state of the page. Browsers typically do not render
  /// hidden elements.
  ///
  /// ```swift
  /// Div {
  ///   Text("This content is hidden")
  /// }
  /// .hidden()
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element is hidden.
  ///   Defaults to true.
  ///
  /// - SeeAlso: W3C [`hidden`](https://html.spec.whatwg.org/multipage/interaction.html#attr-hidden) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func hidden(_ condition: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("hidden", condition: condition))
  }

  /// Indicates that the element is not yet, or is no longer, relevant.
  ///
  /// - Parameter state: The hidden state of the element.
  @available(iOS 17.0, macOS 14.0, *)
  public func hidden(_ state: HiddenState) -> some View {
    return modifier(AttributeModifier(.hidden, value: state.rawValue))
  }
}
