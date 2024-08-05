/// Constants that control the wrapping of content around a view.
///
/// - SeeAlso: Tailwind CSS' [floats](https://tailwindcss.com/docs/float) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum FloatMode: String {
  case start
  case end
  case right
  case left
  case none
}

extension View {
  /// Change how content wraps around the modified view.
  ///
  /// - SeeAlso: Tailwind CSS' [floats](https://tailwindcss.com/docs/float) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func float(_ floatMode: FloatMode, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "float-" + floatMode.rawValue, condition: condition))
  }
}
