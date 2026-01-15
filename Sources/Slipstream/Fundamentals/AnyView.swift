import SwiftSoup

/// A type-erased view.
///
/// An `AnyView` allows changing the type of view used in a given view
/// hierarchy.
public struct AnyView: View {
  /// Creates an AnyView.
  public init<V>(_ view: V) where V: View {
    self.view = view
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    try injectEnvironment(environment: environment).view.render(container, environment: environment)
  }
  
  @_documentation(visibility: private)
  public func style(environment: EnvironmentValues) async throws {
    try await injectEnvironment(environment: environment).view.style(environment: environment)
  }

  private let view: any View
}
