import SwiftSoup

/// A view that defines the document's metadata container.
///
/// Every web page starts with an HTML view.
///
/// ```swift
/// struct MySiteMetadata: View {
///   var body: some View {
///     Head {
///       // Add document metadata here.
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`head`](https://www.w3.org/TR/2012/WD-html-markup-20121025/head.html#head) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Head<Content>: View where Content: View {
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let head = Element(.init("head"), "")
    try self.content().render(head, environment: environment)
    try container.addChildren(head)
  }

  private let content: () -> Content
}
