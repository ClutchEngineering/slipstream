/// A view that has no special meaning at all.
///
/// A Div represents its children. Modifiers applied to a Div will
/// propagate to its children.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Div {
///         DOMString("Hello, world!")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`div`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-div-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Div<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "div"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Div view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
