extension View {
  /// Sets custom data attributes on the view.
  ///
  /// - Parameter attributes: A dictionary of key/value data pairs that will be added
  /// to the view. Note that dictionary keys must be lowercase. Each key value will be prefixed
  /// with a "data-" prefix automatically.
  ///
  /// - SeeAlso: W3C [`data-*`](https://html.spec.whatwg.org/multipage/dom.html#embedding-custom-non-visible-data-with-the-data-*-attributes) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func data(_ attributes: [String: String]) -> some View {
    var prefixedAttributes: [String: String] = [:]
    for (key, value) in attributes {
      prefixedAttributes["data-" + key] = value
    }
    return modifier(AttributeModifier(prefixedAttributes))
  }
}
