/// A set of Tailwind CSS conditions.
///
/// - SeeAlso: Tailwind CSS' [`responsive design`](https://tailwindcss.com/docs/responsive-design) documentation.
/// - SeeAlso: Tailwind CSS' [`hover, focus, and other states`](https://tailwindcss.com/docs/hover-focus-and-other-states) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct Condition {
  /// Creates a Condition with a set of states.
  public init(state: State.Set) {
    self.startingAtBreakpoint = nil
    self.endingBeforeBreakpoint = nil
    self.state = state
  }

  /// Creates a Condition that starts at a given breakpoint.
  public init(startingAt breakpoint: Breakpoint) {
    self.startingAtBreakpoint = breakpoint
    self.endingBeforeBreakpoint = nil
    self.state = nil
  }

  /// Creates a Condition that starts at a given breakpoint and set of states.
  public init(startingAt breakpoint: Breakpoint, state: State.Set) {
    self.startingAtBreakpoint = breakpoint
    self.endingBeforeBreakpoint = nil
    self.state = state
  }

  /// Creates a Condition that applies within the range of breakpoints.
  public init(within range: Range<Breakpoint>) {
    self.startingAtBreakpoint = range.lowerBound
    self.endingBeforeBreakpoint = range.upperBound
    self.state = nil
  }

  /// A convenience condition representing dark mode.
  public static let dark = Condition(state: .dark)

  /// A convenience condition representing the hover state.
  public static let hover = Condition(state: .hover)

  /// A convenience condition representing the active state.
  public static let active = Condition(state: .active)

  /// A convenience condition representing a minimum breakpoint.
  public static func startingAt(_ breakpoint: Breakpoint) -> Self {
    return Condition(startingAt: breakpoint)
  }

  /// A convenience condition representing a minimum breakpoint.
  public static func within(_ range: Range<Breakpoint>) -> Self {
    return Condition(within: range)
  }

  var tailwindClassModifiers: String {
    var modifiers: [String] = []
    if let startingAtBreakpoint {
      modifiers.append(startingAtBreakpoint.asTailwindClass)
    }
    if let endingBeforeBreakpoint {
      modifiers.append("max-" + endingBeforeBreakpoint.asTailwindClass)
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

  private let startingAtBreakpoint: Breakpoint?
  private let endingBeforeBreakpoint: Breakpoint?
  private let state: State.Set?
}
