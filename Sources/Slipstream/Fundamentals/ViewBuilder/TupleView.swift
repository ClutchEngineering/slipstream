import SwiftSoup

/// A View created from a swift tuple of View values.
@_documentation(visibility: private)
@available(iOS 17.0, macOS 14.0, *)
public struct TupleView<T>: View {
  public typealias Content = Never

  init(value: T) {
    self.value = value
  }

  private var value: T

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    /// Our tuple may be composed of any number of View types, so we use Mirror to
    /// read the sub-types of the tuple and render each view in kind.
    try Mirror(reflecting: value)
      .children
      .compactMap { $0.value as? any View }
      .forEach { try $0.render(container, environment: environment) }
  }
}
