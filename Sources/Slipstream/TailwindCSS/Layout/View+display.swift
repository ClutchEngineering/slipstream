/// Constants that control the display box type of a view.
///
/// - SeeAlso: Tailwind CSS' [`display`](https://tailwindcss.com/docs/display) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Display: String {
  case block
  case inlineBlock = "inline-block"
  case inline
  case flex
  case inlineFlex = "inline-flex"
  case table
  case inlineTable = "inline-table"
  case tableCaption = "table-caption"
  case tableCell = "table-cell"
  case tableColumn = "table-column"
  case tableColumnGroup = "table-column-group"
  case tableFooterGroup = "table-footer-group"
  case tableHeaderGroup = "table-header-group"
  case tableRowGroup = "table-row-group"
  case tableRow = "table-row"
  case flowRoot = "flow-root"
  case grid
  case inlineGrid = "inline-grid"
  case contents
  case listItem = "list-item"
  case hidden
}

extension View {
  /// Changes the display box type of the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [`display`](https://tailwindcss.com/docs/display) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func display(_ display: Display, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: display.rawValue, condition: condition))
  }

  /// Hides the view.
  @available(iOS 17.0, macOS 14.0, *)
  public func hidden(condition: Condition? = nil) -> some View {
    return display(.hidden, condition: condition)
  }
}
