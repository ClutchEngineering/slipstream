/// Constants that specify how flex and grid views are positioned along a container's main axis.
///
/// - SeeAlso: Tailwind CSS' [`justify content`](https://tailwindcss.com/docs/justify-content) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum JustifyContent: String {
  /// Packs content items in their default position as if no
  /// justify-content value was set.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌──────────────────────────────────────────────┐
  /// │ ┌─┐ ┌─┐ ┌─┐                                  │
  /// │ └─┘ └─┘ └─┘                                  │
  /// └──────────────────────────────────────────────┘
  /// ```
  case normal

  /// Justifies items against the start of the container’s main axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │ ┌─┐ ┌─┐ ┌─┐                                 │
  /// │ └─┘ └─┘ └─┘                                 │
  /// └─────────────────────────────────────────────┘
  /// ```
  case start

  /// Justifies items against the end of the container’s main axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │                                 ┌─┐ ┌─┐ ┌─┐ │
  /// │                                 └─┘ └─┘ └─┘ │
  /// └─────────────────────────────────────────────┘
  /// ```
  case end

  /// Justifies items against the center of the container’s main axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │                 ┌─┐ ┌─┐ ┌─┐                 │
  /// │                 └─┘ └─┘ └─┘                 │
  /// └─────────────────────────────────────────────┘
  /// ```
  case center

  /// Justifies items along the container’s main axis such that there
  /// is an equal amount of space between each item.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │ ┌─┐                 ┌─┐                 ┌─┐ │
  /// │ └─┘                 └─┘                 └─┘ │
  /// └─────────────────────────────────────────────┘
  /// ```
  case between

  /// Justifies items along the container’s main axis such that there
  /// is an equal amount of space on each side of each item.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │      ┌─┐            ┌─┐            ┌─┐      │
  /// │      └─┘            └─┘            └─┘      │
  /// └─────────────────────────────────────────────┘
  /// ```
  case around

  /// Justifies items along the container’s main axis such that there
  /// is an equal amount of space around each item, but also
  /// accounting for the doubling of space you would normally see
  /// between each item when using ``JustifyContent/around``.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌─────────────────────────────────────────────┐
  /// │         ┌─┐         ┌─┐         ┌─┐         │
  /// │         └─┘         └─┘         └─┘         │
  /// └─────────────────────────────────────────────┘
  /// ```
  case evenly

  /// Allows content items to fill the available space along the
  /// container’s main axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────────────────────────────┐
  /// │ ┌───────────┐ ┌───────────┐ ┌───────────┐ │
  /// │ └───────────┘ └───────────┘ └───────────┘ │
  /// └───────────────────────────────────────────┘
  /// ```
  case stretch
}

extension View {
  /// Controls how flex and grid views are positioned along a container's main axis.
  ///
  /// - SeeAlso: Tailwind CSS' [`justify content`](https://tailwindcss.com/docs/justify-content) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func justifyContent(_ justifyContent: JustifyContent, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "justify-" + justifyContent.rawValue, condition: condition))
  }
}
