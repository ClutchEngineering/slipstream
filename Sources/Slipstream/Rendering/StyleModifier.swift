import Foundation
import SwiftSoup

/// A protocol for components that provide CSS styles.
///
/// Components conforming to this protocol can expose CSS styles that should be
/// included in the final stylesheet during the build process.
///
/// Example:
/// ```swift
/// struct MyComponent: View, StyleModifier {
///     var style: String {
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
public protocol StyleModifier: Sendable {
    /// The CSS styles for this component instance.
    var style: String { get }
    
    /// A descriptive name for this component (used in CSS comments).
    var componentName: String { get }
}

@available(iOS 17.0, macOS 14.0, *)
public extension StyleModifier {
    /// Default component name derived from the type name.
    ///
    /// This default implementation uses Swift's type reflection to generate
    /// a component name from the conforming type's name.
    var componentName: String {
        String(describing: type(of: self))
    }
}
