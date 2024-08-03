extension View {
  /// Applies a modifier to a view and returns a new view.
  ///
  /// Use this modifier to combine a ``View`` and a ``ViewModifier``, to
  /// create a new view. For example, if you create a view modifier for
  /// a new kind of caption with blue text surrounded by a rounded rectangle:
  ///
  /// ```swift
  /// struct TitleText: ViewModifier {
  ///   func body(content: Content) -> some View {
  ///     content
  ///       .font(.extraLarge)
  ///       .bold()
  ///   }
  /// }
  /// ```
  ///
  /// You can use ``modifier(_:)`` to extend ``View`` to create new modifier
  /// for applying the `TitleText` defined above:
  ///
  /// ```swift
  /// extension View {
  ///   func titleText() -> some View {
  ///     modifier(TitleText())
  ///   }
  /// }
  /// ```
  ///
  /// Then you can apply title text to any view:
  ///
  /// ```swift
  /// Text("Slipstream")
  ///   .titleText()
  /// ```
  ///
  /// - Parameter modifier: The modifier to apply to this view.
  public func modifier<M: ViewModifier>(_ modifier: M) -> M.Body where M: ViewModifier, M.Content == Self {
    return modifier.body(content: self)
  }
}
