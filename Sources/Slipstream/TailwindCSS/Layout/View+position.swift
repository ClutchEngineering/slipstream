/// Constants that control how a view is positioned in the DOM
///
/// - SeeAlso: Tailwind CSS' [position](https://tailwindcss.com/docs/position) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Position: String {

  /// Positions a view according to the normal flow of the document.
  ///
  /// Any offsets will be ignored and the view will not act as a
  /// position reference for absolutely positioned children.
  ///
  /// - SeeAlso: Tailwind CSS' [static positioning](https://tailwindcss.com/docs/position#statically-positioning-elements) documentation.
  case `static`

  /// Positions a view relative to the browser window.
  ///
  /// Any offsets are calculated relative to the viewport and the
  /// view will act as a position reference for absolutely positioned
  /// children.
  ///
  /// - SeeAlso: Tailwind CSS' [fixed positioning](https://tailwindcss.com/docs/position#fixed-positioning-elements) documentation.
  case fixed

  /// Positions a view outside of the normal flow of the document,
  /// causing neighboring views to act as if the view doesn’t exist.
  ///
  /// Any offsets are calculated relative to the nearest parent that
  /// has a position other than static, and the view will act as
  /// a position reference for other absolutely positioned children.
  ///
  /// - SeeAlso: Tailwind CSS' [absolute positioning](https://tailwindcss.com/docs/position#absolutely-positioning-elements) documentation.
  case absolute

  /// Positions an element according to the normal flow of the document.
  ///
  /// Any offsets are calculated relative to the view's normal
  /// position and the view will act as a position reference for
  /// absolutely positioned children.
  ///
  /// - SeeAlso: Tailwind CSS' [relative positioning](https://tailwindcss.com/docs/position#relatively-positioning-elements) documentation.
  case relative

  /// Positions a view as relative until it crosses a specified
  /// threshold, then treats it as fixed until its parent is off screen.
  ///
  /// Any offsets are calculated relative to the view's normal position
  /// and the view will act as a position reference for absolutely
  /// positioned children.
  ///
  /// - SeeAlso: Tailwind CSS' [sticky positioning](https://tailwindcss.com/docs/position#sticky-positioning-elements) documentation.
  case sticky
}

extension View {
  /// Changes how a view is positioned in the DOM.
  ///
  /// - SeeAlso: Tailwind CSS' [position](https://tailwindcss.com/docs/position) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func position(_ position: Position, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: position.rawValue, condition: condition))
  }
}
