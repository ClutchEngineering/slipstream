/// A property wrapper that reads a value from a view's environment.
///
/// Use the `Environment` property wrapper to read a value stored in a view's
/// environment. Indicate the value to read using an ``EnvironmentValues``
/// key path in the property declaration.
///
/// You can condition a view's content on the associated value, which
/// you read from the declared property's ``wrappedValue``. As with any property
/// wrapper, you access the wrapped value by directly referring to the property:
///
/// You can use this property wrapper to read --- but not set --- an environment
/// value. You can override existing environment values, as well as set custom
/// environment values that you define, using the ``View/environment(_:_:)``
/// view modifier.
@available(iOS 17.0, macOS 14.0, *)
@propertyWrapper
public struct Environment<Value> {
  /// Creates an environment property to read the specified key path.
  ///
  /// Don’t call this initializer directly. Instead, declare a property
  /// with the ``Environment`` property wrapper, and provide the key path of
  /// the environment value that the property should reflect:
  ///
  /// ```swift
  /// struct MyView: View {
  ///   @Environment(\.path) var path
  ///
  ///   // ...
  /// }
  /// ```
  ///
  /// You can't modify the environment value using a property like this. Instead,
  /// use the ``View/environment(_:_:)`` view modifier on a view to set
  /// a value for a view hierarchy.
  ///
  /// - Parameter keyPath: A key path to a specific resulting value.
  public init(_ keyPath: KeyPath<EnvironmentValues, Value>) {
    self.keyPath = keyPath
  }

  /// The current value of the environment property.
  ///
  /// The wrapped value property provides primary access to the value's data.
  /// However, you don't access `wrappedValue` directly. Instead, you read the
  /// property variable created with the ``Environment`` property wrapper.
  public var wrappedValue: Value {
    get { environmentValues[keyPath: keyPath] }
    set { fatalError("Wrapped value should not be used.") }
  }

  /// The environment storage, from which the value of the property will be retrieved.
  ///
  /// When a view is rendered, this property will be modified with the contextual environment values.
  private var environmentValues: EnvironmentValues = EnvironmentValues()

  /// The key path to the property represented by this Environment wrapper.
  private let keyPath: KeyPath<EnvironmentValues, Value>
}
