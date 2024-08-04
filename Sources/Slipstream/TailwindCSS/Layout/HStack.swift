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
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.   
  ///   - reversed: If true, the contents will be arranged in the reverse direction of text.
  ///   - content: The content to display with this view.
  public init(spacing: Double? = nil, reversed: Bool = false, @ViewBuilder content: @escaping () -> Content) {
    self.spacing = spacing
    self.reversed = reversed
    self.content = content
  }

  @_documentation(visibility: private)
  public var body: some View {
    let container = Div { content() }
      .display(.flex)
      .flexDirection(.x, reversed: reversed)
    if let spacing {
      container
        .flexGap(.x, width: spacing)
    } else {
      container
    }
  }

  private let spacing: Double?
  private let reversed: Bool
  private let content: () -> Content
}
