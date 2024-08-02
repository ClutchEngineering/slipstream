/// A custom parameter attribute that constructs views from closures.
///
/// You typically use ``ViewBuilder`` as a parameter attribute for child
/// view-producing closure parameters, allowing those closures to provide
/// multiple child views.
@available(iOS 17.0, macOS 14.0, *)
@resultBuilder
public struct ViewBuilder {
  /// Passes a single view written as a child view through unmodified.
  ///
  /// An example of a single view written as a child view is
  ///
  /// ```swift
  /// var body: some View {
  ///   Text("Hello")
  /// }
  /// ```
  public static func buildBlock<Content>(_ content: Content) -> Content where Content: View {
    return content
  }

  /// Gathers multiple views into a single tuple view.
  ///
  /// An example of a tuple of views written as a child view is
  ///
  /// ```swift
  /// var body: some View {
  ///   Text("Hello, ")
  ///   Text("world!")
  /// }
  /// ```
  public static func buildBlock<each Content>(_ content: repeat each Content) -> TupleView<(repeat each Content)>
  where repeat each Content: View {
    return TupleView(value: (repeat each content))
  }

  /// An if/else statement, when the condition returns true.
  ///
  /// An example:
  ///
  /// ```swift
  /// var body: some View {
  ///   if true {
  ///     Text("true")
  ///   } else {
  ///     Text("false")
  ///   }
  /// }
  /// ```
  public static func buildEither<TrueContent, FalseContent>(first: TrueContent) -> ConditionalView<TrueContent, FalseContent>
  where TrueContent: View, FalseContent: View {
    return .init(condition: .isTrue(first))
  }


  /// An if/else statement, when the condition returns false.
  ///
  /// An example:
  ///
  /// ```swift
  /// var body: some View {
  ///   if false {
  ///     Text("true")
  ///   } else {
  ///     Text("false")
  ///   }
  /// }
  /// ```
  public static func buildEither<TrueContent, FalseContent>(second: FalseContent) -> ConditionalView<TrueContent, FalseContent>
  where TrueContent: View, FalseContent: View {
    return .init(condition: .isFalse(second))
  }
}
