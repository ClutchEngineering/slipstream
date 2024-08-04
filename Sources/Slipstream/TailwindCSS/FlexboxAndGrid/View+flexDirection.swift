extension View {
  /// Changes the layout direction of flexbox children in this view.
  ///
  /// - SeeAlso: Tailwind CSS' [`flex direction`](https://tailwindcss.com/docs/flex-direction) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func flexDirection(_ axis: Axis, reversed: Bool = false, condition: Condition? = nil) -> some View {
    let flexDirectionSuffix: String
    switch axis {
    case .x: flexDirectionSuffix = "row"
    case .y: flexDirectionSuffix = "col"
    }
    return modifier(
      TailwindClassModifier(
        add: "flex-" + flexDirectionSuffix + (reversed ? "-reverse" : ""),
        condition: condition
      )
    )
  }
}
