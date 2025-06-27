/// A set of Tailwind CSS conditions.
///
/// - SeeAlso: Tailwind CSS' [`responsive design`](https://tailwindcss.com/docs/responsive-design) documentation.
/// - SeeAlso: Tailwind CSS' [`hover, focus, and other states`](https://tailwindcss.com/docs/hover-focus-and-other-states) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct Condition: Sendable {
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

  /// Creates a Condition that applies within the range of breakpoints and set of states.
  public init(within range: Range<Breakpoint>, state: State.Set) {
    self.startingAtBreakpoint = range.lowerBound
    self.endingBeforeBreakpoint = range.upperBound
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

  /// A convenience condition representing the focus state.
  public static let focus = Condition(state: .focus)

  /// A convenience condition representing a minimum breakpoint.
  public static func startingAt(_ breakpoint: Breakpoint) -> Self {
    return Condition(startingAt: breakpoint)
  }

  /// A convenience condition representing a minimum breakpoint.
  public static func within(_ range: Range<Breakpoint>) -> Self {
    return Condition(within: range)
  }

  /// Combines two Conditions as a union of both conditions' possible states.
  public static func +(lhs: Self, rhs: Self) -> Self {
    var union = lhs
    if let lhsStarting = lhs.startingAtBreakpoint ?? rhs.startingAtBreakpoint,
       let rhsStarting = rhs.startingAtBreakpoint ?? lhs.startingAtBreakpoint {
      union.startingAtBreakpoint = min(lhsStarting, rhsStarting)
    }
    if let lhsEnding = lhs.endingBeforeBreakpoint ?? rhs.endingBeforeBreakpoint,
       let rhsEnding = rhs.endingBeforeBreakpoint ?? lhs.endingBeforeBreakpoint {
      union.endingBeforeBreakpoint = max(lhsEnding, rhsEnding)
    }
    if lhs.state != nil || rhs.state != nil {
      union.state = (lhs.state ?? .init()).union((rhs.state ?? .init()))
    }
    return union
  }

  var tailwindClassModifiers: String {
    var modifiers: [String] = []
    if let startingAtBreakpoint,
       startingAtBreakpoint != .small {
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

  private var startingAtBreakpoint: Breakpoint?
  private var endingBeforeBreakpoint: Breakpoint?
  private var state: State.Set?
}
