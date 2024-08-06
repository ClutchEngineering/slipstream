/// Constants that specify how flex and grid views are positioned along a container's cross axis.
///
/// - SeeAlso: Tailwind CSS' [`align items`](https://tailwindcss.com/docs/align-items) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum AlignItems: String {
  /// Stretches views to fill the container’s cross axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────┐
  /// │ ┌───┐ ┌───┐ ┌───┐ │
  /// │ │   │ │   │ │   │ │
  /// │ │   │ │   │ │   │ │
  /// │ │   │ │   │ │   │ │
  /// │ └───┘ └───┘ └───┘ │
  /// └───────────────────┘
  /// ```
  case stretch

  /// Aligns views to the start of the container’s cross axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────┐
  /// │ ┌───┐ ┌───┐ ┌───┐ │
  /// │ └───┘ │   │ │   │ │
  /// │       │   │ └───┘ │
  /// │       └───┘       │
  /// └───────────────────┘
  /// ```
  case start

  /// Aligns views along the center of the container’s cross axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────┐
  /// │       ┌───┐       │
  /// │       │   │ ┌───┐ │
  /// │ ┌───┐ │   │ │   │ │
  /// │ └───┘ │   │ │   │ │
  /// │       │   │ └───┘ │
  /// │       └───┘       │
  /// └───────────────────┘
  /// ```
  case center

  /// Aligns views to the end of the container’s cross axis.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────┐
  /// │       ┌───┐       │
  /// │       │   │       │
  /// │       │   │ ┌───┐ │
  /// │ ┌───┐ │   │ │   │ │
  /// │ └───┘ └───┘ └───┘ │
  /// └───────────────────┘
  /// ```
  case end

  /// Aligns views along the container’s cross axis such
  /// that all of their baselines align.
  ///
  /// When along the x-axis:
  ///
  /// ```
  /// ┌───────────────────┐
  /// │       ┌───┐ ┌───┐ │
  /// │ ┌───┐ │   │ │   │ │
  /// │ │ 1 │ │ 2 │ │ 3 │ │
  /// │ │   │ │   │ └───┘ │
  /// │ └───┘ └───┘       │
  /// └───────────────────┘
  /// ```
  case baseline
}

extension View {
  /// Controls how flex and grid views are positioned along a container's cross axis.
  ///
  /// - SeeAlso: Tailwind CSS' [`align items`](https://tailwindcss.com/docs/align-items) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func alignItems(_ alignItems: AlignItems, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "items-" + alignItems.rawValue, condition: condition))
  }
}
