extension View {
  /// Tells a view that acts as a cell in a grid to span the specified number of rows.
  ///
  /// - SeeAlso: Tailwind CSS' [grid-row](https://tailwindcss.com/docs/grid-row) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func gridCellRows(_ count: Int, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "row-span-\(count)",
        condition: condition
      )
    )
  }

  /// Tells a view that acts as a cell in a grid to span the specified number of rows.
  ///
  /// - SeeAlso: Tailwind CSS' [grid-row](https://tailwindcss.com/docs/grid-row) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func gridCellRows(_ span: GridSpan, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "row-span-" + span.rawValue,
        condition: condition
      )
    )
  }
}
