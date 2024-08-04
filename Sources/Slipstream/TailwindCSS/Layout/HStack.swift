/// A flex view that positions its views horizontally in the same direction as text.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       HStack {
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
public struct HStack<Content: View>: View {
  /// Creates an HStack view.
  /// 
  /// - Parameters:
  ///   - reversed: If true, the contents will be arranged in the reverse direction of text.
  ///   - content: The content to display with this view.
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
    .flexDirection(.row, reversed: reversed)
  }

  private let reversed: Bool
  private let content: () -> Content
}
