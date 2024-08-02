/// A view that doesn't contain any content.
///
/// You will rarely, if ever, need to create an `EmptyView` directly. Instead,
/// `EmptyView` represents the absence of a view.
///
/// Slipstream uses `EmptyView` in situations where a Slipstream view type defines one
/// or more child views with generic parameters, and allows the child views to
/// be absent. When absent, the child view's type in the generic type parameter
/// is `EmptyView`.
@available(iOS 17.0, macOS 14.0, *)
public struct EmptyView: View {
  public typealias Content = Never

  /// Creates an empty view.
  public init() {
  }
}
