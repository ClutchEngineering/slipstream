import Foundation
import SwiftSoup

/// A protocol for components that provide CSS styles.
///
/// Components conforming to this protocol can expose CSS styles that should be
/// included in the final stylesheet during the build process.
///
/// Example:
/// ```swift
/// struct MyComponent: View, HasComponentCSS {
///     var componentCSS: String {
///         """
///         .my-component {
///             background-color: red;
///         }
///         """
///     }
///     
///     var componentName: String { "MyComponent" }
///     
///     var body: some View {
///         // Component implementation
///     }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public protocol HasComponentCSS {
    /// The CSS styles for this component instance.
    var componentCSS: String { get }
    
    /// A descriptive name for this component (used in CSS comments).
    var componentName: String { get }
}

@available(iOS 17.0, macOS 14.0, *)
public extension HasComponentCSS {
    /// Default component name derived from the type name.
    ///
    /// This default implementation uses Swift's type reflection to generate
    /// a component name from the conforming type's name.
    var componentName: String {
        String(describing: type(of: self))
    }
}

// MARK: - Automatic Registration

@available(iOS 17.0, macOS 14.0, *)
extension View where Self: HasComponentCSS {
    /// Automatically registers this component's CSS when rendering.
    ///
    /// Views conforming to `HasComponentCSS` are automatically registered with
    /// the component layer context during rendering, allowing CSS to be collected
    /// without manual component list management.
    public func render(_ container: Element, environment: EnvironmentValues) throws {
        // Register this component's CSS with the collection context
        environment.componentLayerContext?.add(self)
        
        // Continue normal rendering
        try injectEnvironment(environment: environment).body.render(container, environment: environment)
    }
}
