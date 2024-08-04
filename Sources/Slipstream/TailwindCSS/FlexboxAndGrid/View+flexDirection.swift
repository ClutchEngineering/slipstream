/// Constants that control the direction of flex views.
///
/// - SeeAlso: Tailwind CSS' [`flex direction`](https://tailwindcss.com/docs/flex-direction) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FlexDirection: String {
  case row
  case column = "col"
}

extension View {
  /// Changes the direction of flex items for this view.
  ///
  /// - SeeAlso: Tailwind CSS' [`flex direction`](https://tailwindcss.com/docs/flex-direction) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func flexDirection(_ direction: FlexDirection, reversed: Bool = false, condition: Condition? = nil) -> some View {
    return modifier(
      TailwindClassModifier(
        add: "flex-" + direction.rawValue + (reversed ? "-reverse" : ""),
        condition: condition
      )
    )
  }
}
