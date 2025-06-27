/// A view that represents a list item.
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
/// - SeeAlso: W3C [`li`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-li-element) specification.
///
/// ## See Also
///
/// - ``List``
public struct ListItem<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "li"

  /// Creates a list item.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content
}
