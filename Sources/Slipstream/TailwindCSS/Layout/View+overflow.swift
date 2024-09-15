/// Constants that control how a view handles content that is too large for the container.
///
/// - SeeAlso: Tailwind CSS' [overflow](https://tailwindcss.com/docs/overflow) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Overflow: String {
  case auto
  case hidden
  case clip
  case visible
  case scroll
}

extension View {
  /// Changes the clipping behavior of the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [overflow](https://tailwindcss.com/docs/overflow) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func overflow(_ overflow: Overflow, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "overflow-" + overflow.rawValue, condition: condition))
  }

  /// Changes the clipping behavior of the modified view for a specific axis.
  ///
  /// - SeeAlso: Tailwind CSS' [overflow](https://tailwindcss.com/docs/overflow) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func overflow(_ overflow: Overflow, axis: Axis, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "overflow-" + axis.rawValue + "-" + overflow.rawValue, condition: condition))
  }

  /// Enables clipping on the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [overflow](https://tailwindcss.com/docs/overflow) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func clipsToBounds(condition: Condition? = nil) -> some View {
    return overflow(.hidden, condition: condition)
  }
}
