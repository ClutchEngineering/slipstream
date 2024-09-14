import SwiftSoup

/// An HTML comment that will be rendered in the document.
@available(iOS 17.0, macOS 14.0, *)
public struct Comment: View {
  public init(_ string: String) {
    self.string = string
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    try container.append("<!-- \(string) -->")
  }

  private let string: String
}
