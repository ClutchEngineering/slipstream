/// The translate attribute specifies whether an element's attribute values and text content
/// should be translated when the page is localized.
@available(iOS 17.0, macOS 14.0, *)
public enum TranslateMode: String {
  /// The element should be translated.
  case yes
  /// The element should not be translated.
  case no
}

extension View {
  /// Specifies whether an element's attribute values and text content should be translated.
  ///
  /// The translate attribute is used to specify whether the element's translatable attributes
  /// and its Text node children should be translated when the page is localized, or whether
  /// to leave them unchanged.
  ///
  /// ```swift
  /// Span("Hello")
  ///   .translatable(.yes)
  ///
  /// Span("API")
  ///   .translatable(.no)
  /// ```
  ///
  /// - Parameter mode: Whether the element should be translated.
  ///
  /// - SeeAlso: W3C [`translate`](https://html.spec.whatwg.org/multipage/dom.html#attr-translate) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func translatable(_ mode: TranslateMode) -> some View {
    return modifier(AttributeModifier(.translate, value: mode.rawValue))
  }

  /// Specifies whether an element's attribute values and text content should be translated.
  ///
  /// - Parameter condition: A Boolean value that determines whether the element should be translated.
  @available(iOS 17.0, macOS 14.0, *)
  public func translatable(_ condition: Bool) -> some View {
    return modifier(AttributeModifier(.translate, value: condition ? "yes" : "no"))
  }
}
