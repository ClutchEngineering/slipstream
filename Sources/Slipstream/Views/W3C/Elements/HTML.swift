import SwiftSoup

/// The html element represents the root of a document.
///
/// View the full [W3C specification](https://www.w3.org/TR/2012/WD-html-markup-20121025/html.html#html).
@available(iOS 17.0, macOS 14.0, *)
public struct HTML<Content>: View where Content: View {
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("html")
    try self.content().render(element, environment: environment)
  }

  private let content: () -> Content
}
