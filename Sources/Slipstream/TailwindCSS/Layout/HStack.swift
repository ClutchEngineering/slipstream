/// Constants that provide SwiftUI-like constants for specifying HStack item alignment.
@available(iOS 17.0, macOS 14.0, *)
public enum HStackAlignment {
  /// Equivalent to ``AlignItems/start``.
  case top

  /// Equivalent to ``AlignItems/end``.
  case bottom

  var alignItemsEquivalent: AlignItems {
    switch self {
    case .top:  return .start
    case .bottom: return .end
    }
  }
}

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
/// 
/// ## See Also
///
/// - ``AlignItems``
@available(iOS 17.0, macOS 14.0, *)
public struct HStack<Content: View>: View {
  /// Creates an HStack view.
  /// 
  /// - Parameters:
  ///   - alignment: Determines how items within the stack are positioned along the y axis.
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.   
  ///   - reversed: If true, the contents will be arranged in the reverse direction of text.
  ///   - content: The content to display with this view.
  public init(
    alignment: AlignItems = .center,
    spacing: Double? = nil,
    reversed: Bool = false,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.alignment = alignment
    self.spacing = spacing
    self.reversed = reversed
    self.content = content
  }

  /// Creates a HStack using SwiftUI-like alignment terminology.
  ///
  /// - Parameters:
  ///   - alignment: Determines how items within the stack are positioned along the y axis.
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.
  ///   - reversed: If true, the contents will be arranged in the reverse direction of text.
  ///   - content: The content to display with this view.
  public init(
    alignment: HStackAlignment,
    spacing: Double? = nil,
    reversed: Bool = false,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.init(
      alignment: alignment.alignItemsEquivalent,
      spacing: spacing,
      reversed: reversed,
      content: content
    )
  }

  @_documentation(visibility: private)
  public var body: some View {
    let container = Div { content() }
      .display(.flex)
      .flexDirection(.x, reversed: reversed)
      .alignItems(alignment)
    if let spacing {
      container
        .flexGap(.x, width: spacing)
    } else {
      container
    }
  }

  private let alignment: AlignItems
  private let spacing: Double?
  private let reversed: Bool
  private let content: () -> Content
}
