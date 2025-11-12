import Foundation

/// Context for collecting CSS components during view traversal.
///
/// This context is used internally by Slipstream to automatically collect
/// components that conform to `StyleModifier` while traversing the view
/// hierarchy via the `style()` method.
@available(iOS 17.0, macOS 14.0, *)
actor StyleContext {
    private var components: [any StyleModifier] = []
    
    /// Adds a component to the collection.
    ///
    /// - Parameter component: A component conforming to `StyleModifier`.
    func add(_ component: any StyleModifier) {
        components.append(component)
    }
    
    /// All collected components.
    var allComponents: [any StyleModifier] {
        components
    }
}
