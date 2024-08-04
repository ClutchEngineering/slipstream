/// A flex view that positions its views vertically.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       VStack {
///         Div {
///           Text("Hello,")
///         }
///         Div {
///           Text("world!")
///         }
///       }
///     }
///   }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct VStack<Content: View>: View {
  /// Creates an HStack view.
  ///
  /// - Parameters:
  ///   - reversed: If true, the contents will be arranged vertically from bottom to top.
  public init(reversed: Bool = false, @ViewBuilder content: @escaping () -> Content) {
    self.reversed = reversed
    self.content = content
  }

  @_documentation(visibility: private)
  public var body: some View {
    Div {
      content()
    }
    .display(.flex)
    .flexDirection(.column, reversed: reversed)
  }

  private let reversed: Bool
  private let content: () -> Content
}
