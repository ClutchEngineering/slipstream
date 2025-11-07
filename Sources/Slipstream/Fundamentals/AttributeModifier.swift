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
  private let attributes: [String: String]

  /// A W3C global attribute, as defined in [3.2.3 Global attributes](https://html.spec.whatwg.org/multipage/dom.html#global-attributes).
  public enum GlobalAttribute: String {
    /// Specifies a keyboard shortcut to activate or focus the element.
    case accesskey

    /// Controls whether and how text input is automatically capitalized.
    case autocapitalize

    /// Indicates that the element should be focused on page load.
    case autofocus

    /// The class attribute is most commonly used by stylesheets to apply styles
    /// to a view.
    case `class`

    /// Indicates whether the element's content is editable.
    case contenteditable

    /// Specifies the element's text directionality.
    case dir

    /// Indicates whether the element can be dragged.
    case draggable

    /// Hints at the type of data that might be entered by the user while editing the element or its contents.
    case enterkeyhint

    /// Indicates that the element is not yet, or is no longer, relevant.
    case hidden

    /// The id attribute specifies its element's unique identifier (ID).
    ///
    /// There are no other restrictions on what form an ID can take; in particular,
    /// IDs can consist of just digits, start with a digit, start with an
    /// underscore, consist of just punctuation, etc.
    case id

    /// Indicates that the element and its descendants should be made non-interactive.
    case inert

    /// Hints at the type of data that might be entered by the user while editing the element.
    case inputmode

    /// Specifies the name of a custom element.
    case `is`

    /// The globally unique identifier of an item.
    case itemid

    /// Used to add properties to an item.
    case itemprop

    /// Properties that are not descendants of an element can be associated with the item using this attribute.
    case itemref

    /// Creates a new item, a group of name-value pairs.
    case itemscope

    /// Specifies the URL of the vocabulary that will be used to define item properties.
    case itemtype

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

    /// A cryptographic nonce used by Content Security Policy.
    case nonce

    /// Indicates that the element is a popover element.
    case popover

    /// Assigns a slot in a shadow DOM shadow tree to an element.
    case slot

    /// Specifies whether the element may be checked for spelling errors.
    case spellcheck

    /// Contains CSS styling declarations to be applied to the element.
    case style

    /// Specifies whether the element can be focused and whether/where it participates in sequential keyboard navigation.
    case tabindex

    /// Advisory information associated with the element.
    case title

    /// Specifies whether an element's attribute values and text content should be translated.
    case translate

    /// Controls whether browser-provided writing suggestions should be offered.
    case writingsuggestions
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
    self.attributes = [attribute: value]
  }

  /// Creates an attribute modifier that will set multiple attribute values on any modified views.
  ///
  /// - Parameters:
  ///   - attributes: A map of global HTML attributes to the values that should be set for them.
  public init(_ attributes: [String: String]) {
    self.attributes = attributes
  }

  @ViewBuilder
  public func body(content: T) -> some View {
    AttributeModifierView(attributes) {
      content
    }
  }
}

private struct AttributeModifierView<Content: View>: View
where Content: Sendable {
  private let attributes: [String: String]
  private let content: @Sendable () -> Content

  init(_ attributes: [String: String], @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.attributes = attributes
    self.content = content
  }

  func render(_ container: Element, environment: EnvironmentValues) throws {
    let shadowDOM = Document("")
    try self.content().render(shadowDOM, environment: environment)
    for child in shadowDOM.getChildNodes() {
      for (key, value) in attributes.sorted(by: { $0.key < $1.key }) {
        try child.attr(key, value)
      }
      try container.appendChild(child)
    }
  }
}

/// A modifier that conditionally sets an HTML attribute on views based on a boolean condition.
///
/// This modifier is used for boolean HTML attributes like `disabled`, `checked`, `required`, etc.
/// When the condition is true, the attribute is set with an empty value. When false, the attribute
/// is not set at all.
@available(iOS 17.0, macOS 14.0, *)
public struct ConditionalAttributeModifier<T: View>: ViewModifier {
  private let attribute: String
  private let condition: Bool

  /// Creates a conditional attribute modifier.
  ///
  /// - Parameters:
  ///   - attribute: The HTML attribute name to conditionally set.
  ///   - condition: Whether the attribute should be present.
  public init(_ attribute: String, condition: Bool) {
    self.attribute = attribute
    self.condition = condition
  }

  @ViewBuilder
  public func body(content: T) -> some View {
    if condition {
      AttributeModifierView([attribute: ""]) {
        content
      }
    } else {
      content
    }
  }
}
