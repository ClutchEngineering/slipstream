extension View {
  /// Tells a view that acts as a cell in a grid to span the specified number of columns.
  ///
  /// - SeeAlso: Tailwind CSS' [grid-column](https://tailwindcss.com/docs/grid-column) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func gridCellColumns(_ count: Int, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "col-span-\(count)",
        condition: condition
      )
    )
  }

  /// Tells a view that acts as a cell in a grid to span the specified number of columns.
  ///
  /// - SeeAlso: Tailwind CSS' [grid-column](https://tailwindcss.com/docs/grid-column) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func gridCellColumns(_ span: GridSpan, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "col-span-" + span.rawValue,
        condition: condition
      )
    )
  }
}
