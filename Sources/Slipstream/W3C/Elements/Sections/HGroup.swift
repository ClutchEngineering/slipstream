/// A view that represents a heading group, typically used to group a heading
/// with one or more subheadings.
///
/// The `<hgroup>` element is used to group a heading element (h1-h6) with any
/// secondary content such as subheadings, alternative titles, or taglines.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       HGroup {
///         H1("The Solar System")
///         Paragraph {
///           DOMString("An overview of our cosmic neighborhood")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`hgroup`](https://html.spec.whatwg.org/multipage/sections.html#the-hgroup-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct HGroup<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "hgroup"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an HGroup view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
