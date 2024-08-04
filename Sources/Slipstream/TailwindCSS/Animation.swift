import Foundation

/// A representation of an animation.
@available(iOS 17.0, macOS 14.0, *)
public struct Animation {
  public static let linear: Animation = .init(timingFunction: .linear)
  public static let easeIn: Animation = .init(timingFunction: .easeIn)
  public static let easeOut: Animation = .init(timingFunction: .easeOut)
  public static let easeInOut: Animation = .init(timingFunction: .easeInOut)

  public static func linear(duration: TimeInterval) -> Animation {
    return .init(timingFunction: .linear, duration: duration)
  }
  public static func easeIn(duration: TimeInterval) -> Animation {
    return .init(timingFunction: .easeIn, duration: duration)
  }
  public static func easeOut(duration: TimeInterval) -> Animation {
    return .init(timingFunction: .easeOut, duration: duration)
  }
  public static func easeInOut(duration: TimeInterval) -> Animation {
    return .init(timingFunction: .easeInOut, duration: duration)
  }

  init(timingFunction: TimingFunction, duration: TimeInterval = 0.150) {
    self.timingFunction = timingFunction
    self.duration = duration
  }

  let timingFunction: TimingFunction
  let duration: TimeInterval
}

/// A representation of an animation timing function.
///
/// - SeeAlso: Tailwind CSS' [`transition timing function`](https://tailwindcss.com/docs/transition-timing-function) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum TimingFunction: String {
  case linear
  case easeIn = "in"
  case easeOut = "out"
  case easeInOut = "in-out"
}
