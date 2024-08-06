/// Constants that specify the bullet/number style of a list.
///
/// - SeeAlso: Tailwind CSS' [list style type](https://tailwindcss.com/docs/list-style-type) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum ListStyle: String {
  case none = "none"
  case disc = "disc"
  case decimal = "decimal"
}

extension View {
  /// Changes the bullet/number style of a list.
  /// 
  /// - SeeAlso: Tailwind CSS' [list style type](https://tailwindcss.com/docs/list-style-type) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func listStyle(_ listStyle: ListStyle, condition: Condition? = nil) -> some View {
    modifier(TailwindClassModifier(add: "list-" + listStyle.rawValue, condition: condition))
  }
}
