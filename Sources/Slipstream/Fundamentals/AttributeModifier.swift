import SwiftSoup

/// A modifier that sets HTML attributes on the views it is modifying.
///
/// You will rarely interact with this type directly, it is used primarily when
/// creating view modifiers that need to adjust one or more HTML
/// attributes.
///
/// Note that attempting to modify an attribute on a ``Text`` view will result in
/// the attribute being silently ignored.
///
/// If you are building a new attribute modifier, it will typically look something
/// like this:
///
/// ```swift
/// extension View {
///   public func language(_ language: String) -> some View {
///     return modifier(AttributeModifier(.lang, value: language))
///   }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct AttributeModifier<T: View>: ViewModifier {
  private let attribute: String
  private let value: String

  /// A W3C global attribute, as defined in [3.2.3 Global attributes](https://html.spec.whatwg.org/multipage/dom.html#global-attributes).
  public enum GlobalAttribute: String {
    /// The class attribute is most commonly used by stylesheets to apply styles
    /// to a view.
    case `class`

    /// The id attribute specifies its element's unique identifier (ID).
    ///
    /// There are no other restrictions on what form an ID can take; in particular,
    /// IDs can consist of just digits, start with a digit, start with an
    /// underscore, consist of just punctuation, etc.
    case id

    /// The lang attribute specifies the primary language for the view's contents
    /// and for any of the view's attributes that contain text. Its value must be a
    /// valid [BCP 47 language tag](https://en.wikipedia.org/wiki/IETF_language_tag),
    /// or the empty string. Setting the attribute to the empty string indicates that
    /// the primary language is unknown.
    ///
    /// If this attribute is omitted from a view, then the language of this view is
    /// the same as the language of its parent view, if any.
    ///
    /// ## Related documentation
    ///
    /// - [Common primary language tags](https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags)
    /// - [Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry)
    case lang
  }

  /// Creates an attribute modifier that will set `attribute` to `value` on any modified views.
  ///
  /// - Parameters:
  ///   - attribute: The global HTML attribute to be modified.
  ///   - value: The value to set on the attrribute.
  public init(_ attribute: GlobalAttribute, value: String) {
    self.init(attribute.rawValue, value: value)
  }

  /// Creates an attribute modifier that will set `attribute` to `value` on any modified views.
  /// 
  /// - Parameters:
  ///   - attribute: The HTML attribute to be modified.
  ///   - value: The value to set on the attrribute.
  public init(_ attribute: String, value: String) {
    self.attribute = attribute
    self.value = value
  }

  @ViewBuilder
  public func body(content: T) -> some View {
    AttributeModifierView(attribute, value: value) {
      content
    }
  }
}

private struct AttributeModifierView<Content: View>: View {
  private let attribute: String
  private let value: String
  private let content: () -> Content

  init(_ attribute: String, value: String, @ViewBuilder content: @escaping () -> Content) {
    self.attribute = attribute
    self.value = value
    self.content = content
  }

  func render(_ container: Element, environment: EnvironmentValues) throws {
    let shadowDOM = Document("")
    try self.content().render(shadowDOM, environment: environment)
    for child in shadowDOM.getChildNodes() {
      try child.attr(attribute, value)
      try container.appendChild(child)
    }
  }
}
