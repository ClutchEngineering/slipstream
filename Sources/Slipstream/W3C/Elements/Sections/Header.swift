/// A view that represents a group of introductory or navigational aids.
///
/// ```swift
/// struct MySiteHeader: View {
///   var body: some View {
///     Header {
///       Navigation {
///         Link("About", destination: URL(string: "/about"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`header`](https://html.spec.whatwg.org/multipage/sections.html#the-header-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Header<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "header"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Header view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
