import SwiftSoup

/// The html element represents the root of a document.
///
/// Every web page starts with an HTML view.
///
/// ```swift
/// struct MySite: View {
///   var body: some View {
///     HTML {
///       // Your site's content.
///     }
///   }
/// }
/// ```
///
/// View the full [W3C specification](https://www.w3.org/TR/2012/WD-html-markup-20121025/html.html#html).
///
/// ## See Also
///
/// - ``View/language(_:)``
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
