/// Constants that provide SwiftUI-like constants for specifying VStack item alignment.
@available(iOS 17.0, macOS 14.0, *)
public enum VStackAlignment {
  /// Equivalent to ``AlignItems/start``.
  case leading

  /// Equivalent to ``AlignItems/end``.
  case trailing

  var alignItemsEquivalent: AlignItems {
    switch self {
    case .leading:  return .start
    case .trailing: return .end
    }
  }
}

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
/// 
/// ## See Also
///
/// - ``AlignItems``
/// - ``VStackAlignment``
@available(iOS 17.0, macOS 14.0, *)
public struct VStack<Content: View>: View {
  /// Creates a VStack.
  ///
  /// - Parameters:
  ///   - alignment: Determines how items within the stack are positioned along the x axis.
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.
  ///   - reversed: If true, the contents will be arranged vertically from bottom to top.
  ///   - content: The content to display with this view.
  public init(
    alignment: AlignItems = .start,
    spacing: Double? = nil,
    reversed: Bool = false,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.alignment = alignment
    self.spacing = spacing
    self.reversed = reversed
    self.content = content
  }

  /// Creates a VStack using SwiftUI-like alignment terminology.
  ///
  /// - Parameters:
  ///   - alignment: Determines how items within the stack are positioned along the x axis.
  ///   - spacing: If provided, the amount of spacing to add between child views. The value is
  ///   expressed in points, and mapped to the closest Tailwind CSS spacing class.
  ///   - reversed: If true, the contents will be arranged vertically from bottom to top.
  ///   - content: The content to display with this view.
  public init(
    alignment: VStackAlignment,
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
      .flexDirection(.y, reversed: reversed)
      .alignItems(alignment)
    if let spacing {
      container
        .flexGap(.y, width: spacing)
    } else {
      container
    }
  }

  private let alignment: AlignItems
  private let spacing: Double?
  private let reversed: Bool
  private let content: () -> Content
}
