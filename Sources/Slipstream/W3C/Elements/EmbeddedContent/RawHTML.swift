import Foundation

import SwiftSoup

/// A view that inserts raw HTML into the document.
///
@available(iOS 17.0, macOS 14.0, *)
public struct RawHTML: View {

  /// Creates a html view.
  public init(_ source: String) {
    self.source = source
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    // DataNode is required to avoid escaping the source.
    try container.appendChild(DataNode(source.utf8Array, container.getBaseUri().utf8Array))
  }

  private let source: String
}
