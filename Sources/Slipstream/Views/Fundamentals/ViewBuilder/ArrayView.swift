import SwiftSoup

/// A View created from a for loop of View values.
@_documentation(visibility: private)
@available(iOS 17.0, macOS 14.0, *)
public struct ArrayView: View {
  public typealias Content = Never

  init(array: [any View]) {
    self.array = array
  }

  private var array: [any View]

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    for view in array {
      try view.render(container, environment: environment)
    }
  }
}
