/// A view that represents content that is tangentially related to the content around it.
///
/// The `Aside` element is typically used for sidebars, call-out boxes, pull quotes,
/// or other content that is related to but separate from the main content.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Section {
///         Paragraph("Main content goes here.")
///       }
///       Aside {
///         H3("Related Links")
///         Navigation {
///           Link("Related Article", destination: URL(string: "/related"))
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`aside`](https://html.spec.whatwg.org/multipage/sections.html#the-aside-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Aside<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "aside"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an Aside view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
