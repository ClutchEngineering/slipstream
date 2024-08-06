/// Tailwind CSS states and pseudo-classes.
///
/// - SeeAlso: Tailwind CSS' [`hover, focus, and other states`](https://tailwindcss.com/docs/hover-focus-and-other-states) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum State: Int32, CaseIterable {
  case hover            = 0b0000_0000_0000_0000_0000_0000_0000_0001
  case focus            = 0b0000_0000_0000_0000_0000_0000_0000_0010
  case active           = 0b0000_0000_0000_0000_0000_0000_0000_0100
  case focusWithin      = 0b0000_0000_0000_0000_0000_0000_0000_1000
  case focusVisible     = 0b0000_0000_0000_0000_0000_0000_0001_0000
  case visited          = 0b0000_0000_0000_0000_0000_0000_0010_0000
  case target           = 0b0000_0000_0000_0000_0000_0000_0100_0000
  case first            = 0b0000_0000_0000_0000_0000_0000_1000_0000
  case last             = 0b0000_0000_0000_0000_0000_0001_0000_0000
  case only             = 0b0000_0000_0000_0000_0000_0010_0000_0000
  case odd              = 0b0000_0000_0000_0000_0000_0100_0000_0000
  case even             = 0b0000_0000_0000_0000_0000_1000_0000_0000
  case firstOfType      = 0b0000_0000_0000_0000_0001_0000_0000_0000
  case lastOfType       = 0b0000_0000_0000_0000_0010_0000_0000_0000
  case onlyOfType       = 0b0000_0000_0000_0000_0100_0000_0000_0000
  case empty            = 0b0000_0000_0000_0000_1000_0000_0000_0000
  case disabled         = 0b0000_0000_0000_0001_0000_0000_0000_0000
  case enabled          = 0b0000_0000_0000_0010_0000_0000_0000_0000
  case checked          = 0b0000_0000_0000_0100_0000_0000_0000_0000
  case indeterminate    = 0b0000_0000_0000_1000_0000_0000_0000_0000
  case `default`        = 0b0000_0000_0001_0000_0000_0000_0000_0000
  case required         = 0b0000_0000_0010_0000_0000_0000_0000_0000
  case valid            = 0b0000_0000_0100_0000_0000_0000_0000_0000
  case invalid          = 0b0000_0000_1000_0000_0000_0000_0000_0000
  case inRange          = 0b0000_0001_0000_0000_0000_0000_0000_0000
  case outOfRange       = 0b0000_0010_0000_0000_0000_0000_0000_0000
  case placeholderShown = 0b0000_0100_0000_0000_0000_0000_0000_0000
  case autofill         = 0b0000_1000_0000_0000_0000_0000_0000_0000
  case readonly         = 0b0001_0000_0000_0000_0000_0000_0000_0000
  case dark             = 0b0010_0000_0000_0000_0000_0000_0000_0000

  /// Returns the Tailwind CSS psuedo-class name for this state.
  var tailwindClassName: String {
    switch self {
    case .hover:            return "hover"
    case .focus:            return "focus"
    case .active:           return "active"
    case .focusWithin:      return "focus-within"
    case .focusVisible:     return "focus-visible"
    case .visited:          return "visited"
    case .target:           return "target"
    case .first:            return "first"
    case .last:             return "last"
    case .only:             return "only"
    case .odd:              return "odd"
    case .even:             return "even"
    case .firstOfType:      return "first-of-type"
    case .lastOfType:       return "last-of-type"
    case .onlyOfType:       return "only-of-type"
    case .empty:            return "empty"
    case .disabled:         return "disabled"
    case .enabled:          return "enabled"
    case .checked:          return "checked"
    case .indeterminate:    return "indeterminate"
    case .`default`:        return "default"
    case .required:         return "required"
    case .valid:            return "valid"
    case .invalid:          return "invalid"
    case .inRange:          return "in-range"
    case .outOfRange:       return "out-of-range"
    case .placeholderShown: return "placeholder-shown"
    case .autofill:         return "autofill"
    case .readonly:         return "readonly"
    case .dark:             return "dark"
    }
  }

  /// A set of states.
  ///
  /// Usage:
  ///
  /// ```swift
  /// let states: State.Set = [.active, .focus]
  /// ```
  @available(iOS 17.0, macOS 14.0, *)
  public struct Set: OptionSet, Hashable {
    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = State.Set

    /// The raw integer value representing the edge. Used internally to distinguish
    /// different edges and combinations of edges.
    public let rawValue: Int32

    /// Creates a new `State` instance from the given raw value.
    ///
    /// - Parameter rawValue: The raw integer value representing the edge.
    public init(rawValue: Int32) {
      self.rawValue = rawValue
    }

    /// Creates set of edges containing only the specified edge.
    public init(_ e: State) {
      self.rawValue = e.rawValue
    }

    public static let hover = State.Set(.hover)
    public static let focus = State.Set(.focus)
    public static let active = State.Set(.active)
    public static let focusWithin = State.Set(.focusWithin)
    public static let focusVisible = State.Set(.focusVisible)
    public static let visited = State.Set(.visited)
    public static let target = State.Set(.target)
    public static let first = State.Set(.first)
    public static let last = State.Set(.last)
    public static let only = State.Set(.only)
    public static let odd = State.Set(.odd)
    public static let even = State.Set(.even)
    public static let firstOfType = State.Set(.firstOfType)
    public static let lastOfType = State.Set(.lastOfType)
    public static let onlyOfType = State.Set(.onlyOfType)
    public static let empty = State.Set(.empty)
    public static let disabled = State.Set(.disabled)
    public static let enabled = State.Set(.enabled)
    public static let checked = State.Set(.checked)
    public static let indeterminate = State.Set(.indeterminate)
    public static let `default` = State.Set(.`default`)
    public static let required = State.Set(.required)
    public static let valid = State.Set(.valid)
    public static let invalid = State.Set(.invalid)
    public static let inRange = State.Set(.inRange)
    public static let outOfRange = State.Set(.outOfRange)
    public static let placeholderShown = State.Set(.placeholderShown)
    public static let autofill = State.Set(.autofill)
    public static let readonly = State.Set(.readonly)
    public static let dark = State.Set(.dark)
  }
}
