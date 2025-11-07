extension View {
  /// The popover attribute indicates that the element is a popover element.
  public enum PopoverState: String {
    /// The element is a manual popover that must be explicitly shown and hidden.
    case manual
    /// The element is an auto popover that can be "light dismissed" by user actions.
    case auto
  }

  /// Indicates that the element is a popover element.
  ///
  /// The popover attribute makes an element into a popover element, which can be shown
  /// and hidden using JavaScript or declarative triggers. Popovers are displayed on top
  /// of other page content.
  ///
  /// ```swift
  /// Div {
  ///   Text("Popover content")
  /// }
  /// .popover(.auto)
  /// .id("my-popover")
  /// ```
  ///
  /// - Parameter state: The popover state determining its dismissal behavior.
  ///
  /// - SeeAlso: W3C [`popover`](https://html.spec.whatwg.org/multipage/popover.html#attr-popover) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func popover(_ state: PopoverState) -> some View {
    return modifier(AttributeModifier(.popover, value: state.rawValue))
  }

  /// Indicates that the element is an auto popover element.
  ///
  /// - Parameter condition: A Boolean value that determines whether the element is a popover.
  ///   Defaults to true.
  @available(iOS 17.0, macOS 14.0, *)
  public func popover(_ condition: Bool = true) -> some View {
    if condition {
      return modifier(AttributeModifier(.popover, value: "auto"))
    } else {
      return modifier(AttributeModifier([:]))
    }
  }
}
