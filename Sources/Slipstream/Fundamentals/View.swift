import SwiftSoup
import TypeIntrospection

/// A type that represents part of your HTML document.
///
/// You create custom views by declaring types that conform to the `View`
/// protocol. Implement the required ``View/body`` computed
/// property to provide the content for your custom view.
///
/// ```swift
/// struct MyView: View {
///   var body: some View {
///     Text("Hello world")
///   }
/// }
/// ```
///
/// Assemble the view's body by combining one or more of the built-in views
/// provided by Slipstream, like the ``Text`` instance in the example above, plus
/// other custom views that you define, into a hierarchy of views.
@available(iOS 17.0, macOS 14.0, *)
public protocol View: Sendable {
  /// The type of view representing the content of this view.
  ///
  /// When you create a custom view, Swift infers this type from your
  /// implementation of the required ``View/body`` property.
  associatedtype Content: View

  /// The content and behavior of the view.
  /// 
  /// When you implement a custom view, you must implement a computed
  /// `body` property to provide the content for your view. Return a view
  /// that's composed of built-in views that Slipstream provides, plus other
  /// composite views that you've already defined:
  ///
  /// ```swift
  /// struct MyView: View {
  ///   var body: some View {
  ///     Text("Hello world")
  ///   }
  /// }
  /// ```
  @ViewBuilder var body: Self.Content { get }

  /// Transforms the view into an HTML representation of itself and adds it
  /// to the given container element.
  ///
  /// This method is typically only implemented when your view needs to perform
  /// some kind of novel transformation of its content into HTML. In most cases,
  /// you'll only need to implement the `body` property.
  ///
  /// If this method is not implemented, a default implementation will be
  /// provided that recurses the render calls on `body`.
  func render(_ container: Element, environment: EnvironmentValues) throws
  
  /// Traverses the view hierarchy to collect CSS styles from components.
  ///
  /// This method is used internally by the rendering system to automatically
  /// collect CSS from views conforming to `StyleModifier`. You typically don't
  /// need to implement this method directly.
  ///
  /// If this method is not implemented, a default implementation will be
  /// provided that recurses the style calls on `body`.
  func style(environment: EnvironmentValues) async throws
}

extension View {
  /// Returns a copy of self with the given environment values injected into any @Environment properties defined by the receiver.
  func injectEnvironment(environment: EnvironmentValues) throws -> Self {
    /// By default, `@Environment` properties have "empty" storage.
    /// Our goal is to return a copy of this view with the environment properties' storage filled
    /// with the current environment values.
    var copy = self

    /// To enumerate all of the `@Environment` properties on this view, we rely on introspection of this view's type.
    let introspectionOfSelf = TypeIntrospection(type: type(of: self).self)
    for viewProperty in introspectionOfSelf.properties {
      /// `@Environment` properties are mutable and have internal `EnvironmentValues` storage.
      guard viewProperty.isVar,
            let environmentValuesProperty = viewProperty.introspection.properties.first(where: { $0.introspection.type is EnvironmentValues.Type }) else {
        continue
      }
      /// To modify the property, we first get the `@Environment` property as an opaque value type.
      var value = try viewProperty.getValue(in: self)
      /// We then use the property abstraction to store our contextual environment on the value (some `@Environment` type).
      try environmentValuesProperty.setValue(to: environment, in: &value)
      /// And lastly, we replace our view's `@Environment` property with the mutated instance.
      try viewProperty.setValue(to: value, in: &copy)

      /// Assume we have a View defined like this:
      ///
      /// ```
      /// struct HeaderLink: View {
      ///   @Environment(\.path) var path
      ///   @Environment(\.weight) var weight
      /// }
      ///
      /// let link = HeaderLink()
      /// ```
      ///
      /// Then in effect, the code above accomplishes the following:
      ///
      /// ```
      /// var copy = link
      /// copy.path.environmentValues = environment
      /// copy.weight.environmentValues = environment
      /// return copy
      /// ```
    }
    return copy
  }

  /// This default implementation recurses the render call on `body`'s contents
  /// and is sufficient for most custom `View`-conforming types.
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    try injectEnvironment(environment: environment).body.render(container, environment: environment)
  }
}

// MARK: - Default implementation for views that only render

@_documentation(visibility: private)
extension View where Content == Never {
  @_documentation(visibility: private)
  public var body: Never {
    fatalError("body should never be executed when a view has declared its Content as Never")
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    // Do nothing.
  }
}

@_documentation(visibility: private)
extension Never: View {
  @_documentation(visibility: private)
  public var body: Never {
    fatalError("body should never be executed on a Never view")
  }
}
