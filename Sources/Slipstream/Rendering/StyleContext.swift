import Foundation

/// Context for collecting CSS components during view rendering.
///
/// This context is used internally by the rendering system to automatically
/// collect components that conform to `StyleModifier` while traversing the
/// view hierarchy. The collected components are then used to generate CSS
/// for the `@layer components` section in Tailwind CSS.
///
/// ## Sendable Conformance Rationale
///
/// This class uses `@unchecked Sendable` because the Swift compiler cannot verify
/// the safety of the mutable state, but the usage pattern is provably safe:
///
/// 1. **Single ownership**: Each `renderSitemap()` invocation creates exactly one instance
/// 2. **Sequential access**: The synchronous rendering loop (line 32-43 in RenderSitemap.swift)
///    processes views one at a time in a for-loop
/// 3. **No sharing**: The instance never escapes the function scope or crosses thread boundaries
/// 4. **Lifetime**: Created → Used → Released within a single call stack
///
/// This is the recommended pattern from Swift Evolution proposals SE-0302 and SE-0306
/// for isolated, single-threaded collections that need `Sendable` conformance for
/// API requirements (in this case, storage in `EnvironmentValues`) but are never
/// actually accessed concurrently.
///
/// Alternative approaches considered and rejected:
/// - **Actor**: Would require async/await throughout the rendering pipeline (breaking change)
/// - **Locks**: Unnecessary synchronization overhead for guaranteed sequential access
/// - **MainActor**: Would couple rendering to main thread (overly restrictive)
@available(iOS 17.0, macOS 14.0, *)
final class StyleContext: @unchecked Sendable {
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
