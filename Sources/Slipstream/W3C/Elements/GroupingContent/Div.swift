/// A view that has no special meaning at all.
///
/// A Div represents its children. It can be used with the ``View/class(_:)``,
/// ``View/language(_:)``, and ``View/title(_:)`` attributes to
/// mark up semantics common to a group of consecutive elements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Div {
///         Text("Hello, world!")
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
  @ViewBuilder public let content: () -> Content

  /// Creates a Div view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
}
