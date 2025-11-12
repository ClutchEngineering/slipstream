import SwiftSoup

/// A type that represents an HTML element type.
///
/// This is a Slipstream type that provides a standard render implementation
/// for common HTML element types. It is not meant to be used outside of
/// this use case.
@_documentation(visibility: private)
@available(iOS 17.0, macOS 14.0, *)
public protocol W3CElement: View {
  associatedtype ChildContent: View

  /// The content to be placed within the tag.
  @ViewBuilder var content: () -> ChildContent { get }

  /// The html tag's name.
  var tagName: String { get }
}

extension W3CElement {
  /// A default implementation for W3C element views that renders the view as
  /// an HTML tag using ``tagName``.
  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement(tagName)
    try self.content().render(element, environment: environment)
  }
  
  /// A default implementation for W3C element views that collects CSS styles
  /// by traversing the content closure.
  @_documentation(visibility: private)
  public func style(environment: EnvironmentValues) async throws {
    try await self.content().style(environment: environment)
  }
}
