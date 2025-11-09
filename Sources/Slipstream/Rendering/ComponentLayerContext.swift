import Foundation

/// Context for collecting CSS components during view rendering.
///
/// This context is used internally by the rendering system to automatically
/// collect components that conform to `HasComponentCSS` while traversing the
/// view hierarchy. The collected components are then used to generate CSS
/// for the `@layer components` section in Tailwind CSS.
///
/// This class is marked as `@unchecked Sendable` because it's only used
/// synchronously within a single rendering pass and is not shared across threads.
@available(iOS 17.0, macOS 14.0, *)
final class ComponentLayerContext: @unchecked Sendable {
    private var components: [any HasComponentCSS] = []
    
    /// Adds a component to the collection.
    ///
    /// - Parameter component: A component conforming to `HasComponentCSS`.
    func add(_ component: any HasComponentCSS) {
        components.append(component)
    }
    
    /// All collected components.
    var allComponents: [any HasComponentCSS] {
        components
    }
}
