/// A flex view that swaps its layout direction based on a condition.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       ResponsiveStack {
///         Div {
///           DOMString("Hello,")
///         }
///         Div {
///           DOMString("world!")
///         }
///       }
///     }
///   }
/// }
/// ```
@available(iOS 17.0, macOS 14.0, *)
public struct ResponsiveStack<Content: View>: View {
  /// Creates a responsive stack view.
  ///
  /// - Parameters:
  ///   - defaultAxis: The default layout axis for this stack.
  ///   - condition: The condition for when to swap the stack's layout.
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.
  ///   - reversed: If true, the contents will be arranged in the reverse direction of text.
  ///   - content: The content to display with this view.
  public init(
    _ defaultAxis: Axis = .y,
    condition: Condition = .init(startingAt: .medium),
    spacing: Double? = nil,
    reversed: Bool = false,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.defaultAxis = defaultAxis
    self.condition = condition
    self.spacing = spacing
    self.reversed = reversed
    self.content = content
  }

  @_documentation(visibility: private)
  public var body: some View {
    let container = Div { content() }
      .display(.flex)
      .flexDirection(defaultAxis, reversed: reversed)
      .flexDirection(oppositeAxis, reversed: reversed, condition: condition)
    if let spacing {
      container
        .flexGap(defaultAxis, width: spacing)
        .flexGap(oppositeAxis, width: spacing, condition: condition)
    } else {
      container
    }
  }

  private var oppositeAxis: Axis {
    switch defaultAxis {
    case .x: return .y
    case .y: return .x
    }
  }

  private let defaultAxis: Axis
  private let condition: Condition
  private let spacing: Double?
  private let reversed: Bool
  private let content: () -> Content
}
