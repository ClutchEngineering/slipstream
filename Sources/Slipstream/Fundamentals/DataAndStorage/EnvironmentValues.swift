/// A collection of environment values propagated through a view hierarchy.
///
/// Like SwiftUI, Slipstream provides a mutable collection of values that your
/// website's views can access as needed.
///
/// You will rarely interact directly with the `EnvironmentValues` structure.
///
/// Instead, to read a value from the structure, declare a property using the
/// ``Environment`` property wrapper and specify the value's key path like so:
///
/// ```swift
/// struct MyView: View {
///   @Environment(\.path) var path
///
///   // ...
/// }
/// ```
///
/// You can set or override some values using the ``View/environment(_:_:)``
/// view modifier like so:
///
/// ```swift
/// MyView()
///   .environment(\.path, "/home")
/// ```
///
/// The value that you set affects the environment for the view that you modify
/// — including its descendants in the view hierarchy — but only up to the
/// point where you apply a different environment modifier.
///
/// Learn how to create custom environment values in <doc:EnvironmentValuesSection>.
@available(iOS 17.0, macOS 14.0, *)
public struct EnvironmentValues {
  /// Creates an environment values instance.
  ///
  /// You don't typically create an instance of ``EnvironmentValues``
  /// directly. Doing so would provide access only to default values that
  /// don't update based on context.
  ///
  /// Instead, you rely on an environment values' instance
  /// that Slipstream manages for you when you use the ``Environment``
  /// property wrapper and the ``View/environment(_:_:)`` view modifier.
  public init() {
  }

  /// Accesses the environment value associated with a custom key.
  public subscript<K>(key: K.Type) -> K.Value where K: EnvironmentKey {
    get { return storage[ObjectIdentifier(K.self)] as? K.Value ?? K.defaultValue }
    set { storage[ObjectIdentifier(K.self)] = newValue }
  }

  private var storage: [ObjectIdentifier: Any] = [:]
}
