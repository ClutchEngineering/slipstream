extension View {
  /// Sets the referrer policy for the view, controlling how much referrer information
  /// should be included with requests.
  ///
  /// The referrerpolicy attribute specifies which referrer information should be sent
  /// when fetching resources or following links from this element.
  ///
  /// - SeeAlso: W3C [referrerpolicy](https://www.w3.org/TR/referrer-policy/#referrer-policy) specification.
  ///
  /// - Parameter policy: The referrer policy to apply. See ``ReferrerPolicy`` for available options.
  ///
  /// ## Example
  ///
  /// ```swift
  /// Link("Privacy-conscious link", destination: URL(string: "/page")!)
  ///   .referrerPolicy(.noReferrer)
  /// ```
  @available(iOS 17.0, macOS 14.0, *)
  public func referrerPolicy(_ policy: ReferrerPolicy) -> some View {
    return modifier(AttributeModifier("referrerpolicy", value: policy.rawValue))
  }
}
