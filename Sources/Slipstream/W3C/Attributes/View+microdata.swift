extension View {
  /// Creates a new item, a group of name-value pairs.
  ///
  /// The itemscope attribute is used to create an item. When an element has an itemscope
  /// attribute, it and its descendants form a new item with associated name-value pairs.
  ///
  /// ```swift
  /// Div {
  ///   Span("John Doe")
  ///     .itemprop("name")
  /// }
  /// .itemscope()
  /// .itemtype("https://schema.org/Person")
  /// ```
  ///
  /// - Parameter condition: A Boolean value that determines whether the element creates an item scope.
  ///   Defaults to true.
  ///
  /// - SeeAlso: W3C [`itemscope`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemscope) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func itemscope(_ condition: Bool = true) -> some View {
    return modifier(ConditionalAttributeModifier("itemscope", condition: condition))
  }

  /// Specifies the URL of the vocabulary that will be used to define item properties.
  ///
  /// The itemtype attribute specifies the item type, typically a URL to a vocabulary like
  /// schema.org that defines the properties of the item.
  ///
  /// ```swift
  /// Div { }
  ///   .itemscope()
  ///   .itemtype("https://schema.org/Person")
  /// ```
  ///
  /// - Parameter type: The URL of the vocabulary defining the item type.
  ///
  /// - SeeAlso: W3C [`itemtype`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemtype) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func itemtype(_ type: String) -> some View {
    return modifier(AttributeModifier(.itemtype, value: type))
  }

  /// The globally unique identifier of an item.
  ///
  /// The itemid attribute is used to specify the globally unique identifier of an item.
  /// The identifier must be a valid URL.
  ///
  /// ```swift
  /// Div { }
  ///   .itemscope()
  ///   .itemtype("https://schema.org/Book")
  ///   .itemid("urn:isbn:978-0-596-52068-7")
  /// ```
  ///
  /// - Parameter id: The globally unique identifier for the item.
  ///
  /// - SeeAlso: W3C [`itemid`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemid) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func itemid(_ id: String) -> some View {
    return modifier(AttributeModifier(.itemid, value: id))
  }

  /// Used to add properties to an item.
  ///
  /// The itemprop attribute is used to add a property to an item. Each element with an
  /// itemprop attribute adds a name-value pair to its item.
  ///
  /// ```swift
  /// Span("John Doe")
  ///   .itemprop("name")
  /// ```
  ///
  /// - Parameter property: The name of the property being added to the item.
  ///
  /// - SeeAlso: W3C [`itemprop`](https://html.spec.whatwg.org/multipage/microdata.html#names:-the-itemprop-attribute) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func itemprop(_ property: String) -> some View {
    return modifier(AttributeModifier(.itemprop, value: property))
  }

  /// Properties that are not descendants of an element can be associated with the item.
  ///
  /// The itemref attribute allows properties that are not descendants of an element with
  /// an itemscope attribute to be associated with the item. It provides a list of element
  /// IDs (not itemids) with additional properties elsewhere in the document.
  ///
  /// ```swift
  /// Div { }
  ///   .itemscope()
  ///   .itemref("prop1 prop2")
  /// ```
  ///
  /// - Parameter refs: A space-separated list of element IDs to reference.
  ///
  /// - SeeAlso: W3C [`itemref`](https://html.spec.whatwg.org/multipage/microdata.html#attr-itemref) specification.
  @available(iOS 17.0, macOS 14.0, *)
  public func itemref(_ refs: String) -> some View {
    return modifier(AttributeModifier(.itemref, value: refs))
  }
}
