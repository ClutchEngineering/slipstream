/// A view that represents a list of items.
///
/// The items can be ordered, where changing the order would
/// change the meaning of the document, or unordered, where
/// the order of the items is not important.
///
/// Lists are unordered by default.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       List {
///         ListItem {
///           Text("Item 1")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`ol`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ol-element) specification.
/// - SeeAlso: W3C [`ul`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-ul-element) specification.
///
/// ## See Also
///
/// - ``ListItem``
public struct List<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public var tagName: String { ordered ? "ol" : "ul" }

  /// Creates a list.
  public init(ordered: Bool = false, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.ordered = ordered
    self.content = content
  }

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content
  private let ordered: Bool
}
