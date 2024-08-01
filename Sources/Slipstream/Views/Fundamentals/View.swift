import SwiftSoup

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
public protocol View {
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
  func render(_ container: Element) throws
}

extension View {
  /// This default implementation recurses the render call on `body`'s contents
  /// and is sufficient for most custom `View`-conforming types.
  public func render(_ container: Element) throws {
    try body.render(container)
  }
}

// MARK: - Default implementation for views that only render

@_documentation(visibility: private)
extension View where Content == Never {
  @_documentation(visibility: private)
  public var body: Never {
    fatalError("body should never be executed when a view has declared its Content as Never")
  }
}

@_documentation(visibility: private)
extension Never: View {
  @_documentation(visibility: private)
  public var body: Never {
    fatalError("body should never be executed on a Never view")
  }
}
