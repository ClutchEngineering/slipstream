import Foundation

extension View {
  /// Indicates which properties should transition when they change.
  ///
  /// - SeeAlso: Tailwind CSS' [transition](https://tailwindcss.com/docs/transition-property) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func transition(_ transition: Transition, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "transition" + transition.rawValue, condition: condition))
  }
}
