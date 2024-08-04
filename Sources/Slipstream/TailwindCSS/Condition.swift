/// A set of Tailwind CSS conditions.
///
/// - SeeAlso: Tailwind CSS' [`responsive design`](https://tailwindcss.com/docs/responsive-design) documentation.
/// - SeeAlso: Tailwind CSS' [`hover, focus, and other states`](https://tailwindcss.com/docs/hover-focus-and-other-states) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct Condition {
  /// Creates a Condition with a set of states.
  public init(state: State.Set) {
    self.minBreakpoint = nil
    self.state = state
  }

  /// Creates a Condition with a minimum breakpoint.
  public init(minBreakpoint: Breakpoint) {
    self.minBreakpoint = minBreakpoint
    self.state = nil
  }

  /// Creates a Condition with a minimum breakpoint and set of states.
  public init(minBreakpoint: Breakpoint, state: State.Set) {
    self.minBreakpoint = minBreakpoint
    self.state = state
  }

  /// A convenience condition representing dark mode.
  public static let dark = Condition(state: .dark)

  /// A convenience condition representing the hover state.
  public static let hover = Condition(state: .hover)

  /// A convenience condition representing the active state.
  public static let active = Condition(state: .active)

  /// A convenience condition representing a minimum breakpoint.
  public static func minBreakpoint(_ minBreakpoint: Breakpoint) -> Self {
    return Condition(minBreakpoint: minBreakpoint)
  }

  var tailwindClassModifiers: String {
    var modifiers: [String] = []
    if let minBreakpoint {
      modifiers.append(minBreakpoint.rawValue)
    }
    if let set = state, set.rawValue != 0 {
      modifiers.append(contentsOf: State.allCases
        .filter { set.contains(.init($0)) }
        .map { $0.tailwindClassName }
        .sorted()
      )
    }
    return modifiers.joined(separator: ":")
  }

  private let minBreakpoint: Breakpoint?
  private let state: State.Set?
}
