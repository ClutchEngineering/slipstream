import SwiftSoup

extension View {
  /// Sets the environment value of the specified key path to the given value.
  ///
  /// Use this modifier to set one of the writable properties of the
  /// ``EnvironmentValues`` structure, including custom values that you
  /// create.
  ///
  /// Prefer dedicated modifiers when available, and offer your own when
  /// defining custom environment values.
  ///
  /// This modifier affects the given view, as well as that view's descendant
  /// views. It has no effect outside the view hierarchy on which you call it.
  ///
  /// - Parameters:
  ///   - keyPath: A key path that indicates the property of the
  ///     ``EnvironmentValues`` structure to update.
  ///   - value: The new value to set for the item specified by `keyPath`.
  ///
  /// - Returns: A view that has the given value set in its environment.
  public func environment<V>(
    _ keyPath: WritableKeyPath<EnvironmentValues, V>,
    _ value: V
  ) -> some View {
    return self.modifier(EnvironmentModifier(keyPath: keyPath, value: value))
  }
}

/// A view modifier that will inject the given environment value assigned to the given keyPath when rendered.
private struct EnvironmentModifier<T: View, Value>: ViewModifier {
  let keyPath: WritableKeyPath<EnvironmentValues, Value>
  let value: Value

  @ViewBuilder
  public func body(content: T) -> some View {
    EnvironmentModifierView(keyPath: keyPath, value: value) {
      content
    }
  }
}

/// Injects an environment value into the environment when the view is rendered.
private struct EnvironmentModifierView<Content: View, Value>: View {
  typealias Body = Never

  let keyPath: WritableKeyPath<EnvironmentValues, Value>
  let value: Value
  let content: () -> Content

  func render(_ container: Element, environment: EnvironmentValues) throws {
    var environment = environment
    environment[keyPath: keyPath] = value
    try self.content().render(container, environment: environment)
  }
}
