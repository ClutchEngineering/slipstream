/// Default Tailwind CSS breakpoints.
///
/// - SeeAlso: Tailwind CSS' [`responsive design`](https://tailwindcss.com/docs/responsive-design) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Breakpoint: Int, Comparable, Sendable {
  case small
  case medium
  case large
  case extraLarge
  case extraExtraLarge

  var asTailwindClass: String {
    switch self {
    case .small: return "sm"
    case .medium: return "md"
    case .large: return "lg"
    case .extraLarge: return "xl"
    case .extraExtraLarge: return "2xl"
    }
  }

  public static func < (lhs: Breakpoint, rhs: Breakpoint) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
}
