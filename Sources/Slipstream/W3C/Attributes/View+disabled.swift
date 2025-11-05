extension View {
  /// Disables the element, preventing user interaction.
  ///
  /// For form-associated elements like fieldset, this attribute disables all
  /// descendant form controls. When disabled, form controls cannot be focused,
  /// edited, or submitted.
  ///
  /// ```swift
  /// Fieldset {
  ///   Legend("Payment Information")
  ///   TextField("Card Number", type: .text)
  /// }
  /// .disabled()
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element is disabled.
  /// - Returns: A view with the disabled attribute conditionally set.
  ///
  /// - SeeAlso: W3C [`disabled`](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#attr-fe-disabled) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func disabled(_ condition: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("disabled", condition: condition))
  }
}
