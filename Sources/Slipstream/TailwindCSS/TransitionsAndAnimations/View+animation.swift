import Foundation

extension View {
  /// Indicates that changes to properties on this view should be animated.
  ///
  /// - SeeAlso: Tailwind CSS' [`transition timing function`](https://tailwindcss.com/docs/transition-timing-function) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func animation(_ animation: Animation, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: [
      "ease-" + animation.timingFunction.rawValue,
      "duration-" + Self.durationToTailwindDuration(duration: animation.duration),
    ], condition: condition))
  }

  /// Maps a duration to the closest Tailwind CSS duration class.
  private static func durationToTailwindDuration(duration: TimeInterval) -> String {
    // Tailwind spacing classes and their corresponding sizes in points.
    let mapping: [(classSuffix: String, duration: TimeInterval)] = [
      ("0", 0),
      ("75", 0.075),
      ("100", 0.100),
      ("150", 0.150),
      ("200", 0.200),
      ("300", 0.300),
      ("500", 0.500),
      ("700", 0.700),
      ("1000", 1.000),
    ]

    let closestClass = mapping.min { abs($0.duration - duration) < abs($1.duration - duration) }
    return closestClass?.classSuffix ?? "0"
  }
}
