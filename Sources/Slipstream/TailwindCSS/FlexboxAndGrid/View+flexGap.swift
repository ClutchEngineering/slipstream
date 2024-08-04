extension View {
  /// Changes the gutters between grid and flexbox views.
  ///
  /// - SeeAlso: Tailwind CSS' [`gap`](https://tailwindcss.com/docs/gap) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func flexGap(_ axis: Axis, width: Double, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "gap-" + axis.rawValue + "-" + Edge.pointToTailwindSpacingClass(ptLength: width),
        condition: condition
      )
    )
  }
}
