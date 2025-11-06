/// A view that represents self-contained content, often with a caption.
///
/// The `<figure>` element is used to encapsulate content such as illustrations,
/// diagrams, photos, code listings, etc., that is referenced from the main content
/// but could be moved to another location without affecting the flow.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Figure {
///         Image(URL(string: "/images/chart.png")!)
///         FigureCaption {
///           DOMString("Sales data for Q4 2024")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`figure`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-figure-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Figure<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "figure"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Figure view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
