extension View {
  /// Sets the primary language for the view's contents and for any of the view's attributes
  /// that contain text.
  ///
  /// If this attribute is omitted from a view, then the language of this view is
  /// the same as the language of its parent view, if any.
  ///
  /// ## Related documentation
  /// 
  /// - [Common primary language tags](https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags)
  /// - [Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry)
  ///
  /// - Parameter language: Must be a valid [BCP 47 language tag](https://en.wikipedia.org/wiki/IETF_language_tag),
  ///   or the empty string. Setting the attribute to the empty string indicates that the primary
  ///   language is unknown.
  public func language(_ language: String) -> some View {
    return modifier(AttributeModifier(.lang, value: language))
  }
}
