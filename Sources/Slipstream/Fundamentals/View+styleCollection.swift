import SwiftSoup

/// Extension providing CSS style collection for views.
///
/// The `style()` method traverses the view hierarchy in the same manner as `render()`,
/// allowing CSS components to be collected automatically from views conforming to
/// `StyleModifier`.
@available(iOS 17.0, macOS 14.0, *)
extension View {
    /// Collects CSS styles from this view and its descendants.
    ///
    /// This method recursively traverses the view hierarchy, similar to the traversal
    /// pattern of `render()`. Views conforming to `StyleModifier` are automatically
    /// registered with the style context.
    ///
    /// This default implementation recurses the style call on `body`'s contents
    /// and is sufficient for most custom `View`-conforming types.
    ///
    /// - Parameter environment: The environment values for this view.
    public func style(environment: EnvironmentValues) async throws {
        // Register if this view conforms to StyleModifier
        if let modifier = self as? any StyleModifier {
            await environment.styleContext?.add(modifier)
        }

        // Only traverse body if Content is not Never
        // This check happens at runtime to avoid accessing .body on leaf views
        guard Content.self != Never.self else {
            return // Leaf view - no body to traverse
        }

        // Traverse body (exactly like render() does)
        try await injectEnvironment(environment: environment).body.style(environment: environment)
    }
}
