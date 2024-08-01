/// A custom parameter attribute that constructs views from closures.
///
/// You typically use ``ViewBuilder`` as a parameter attribute for child
/// view-producing closure parameters, allowing those closures to provide
/// multiple child views.
@available(iOS 17.0, macOS 14.0, *)
@resultBuilder
public struct ViewBuilder {
  /// Passes a single view written as a child view through unmodified.
  ///
  /// An example of a single view written as a child view is
  ///
  /// ```swift
  /// var body: some View {
  ///   Text("Hello")
  /// }
  /// ```
  public static func buildBlock<Content>(_ content: Content) -> Content where Content: View {
    return content
  }
}
