/// A struct representing a frame maximum width value for sizing purposes, with support
/// for both numerical values and Tailwind CSS semantic values.
@available(iOS 17.0, macOS 14.0, *)
public struct FrameMaxWidthValue: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, Sendable {
  public static let none = Self(.none)
  public static let extraSmall = Self(.extraSmall)
  public static let small = Self(.small)
  public static let medium = Self(.medium)
  public static let large = Self(.large)
  public static let extraLarge = Self(.extraLarge)
  public static let extraExtraLarge = Self(.extraExtraLarge)
  public static let extraExtraExtraLarge = Self(.extraExtraExtraLarge)
  public static let fourXLarge = Self(.fourXLarge)
  public static let fiveXLarge = Self(.fiveXLarge)
  public static let sixXLarge = Self(.sixXLarge)
  public static let sevenXLarge = Self(.sevenXLarge)
  public static let eightXLarge = Self(.eightXLarge)
  public static let nineXLarge = Self(.nineXLarge)
  public static let full = Self(.full)
  public static let min = Self(.min)
  public static let max = Self(.max)
  public static let fit = Self(.fit)
  public static let prose = Self(.prose)
  public static let screenSmall = Self(.screenSmall)
  public static let screenMedium = Self(.screenMedium)
  public static let screenLarge = Self(.screenLarge)
  public static let screenExtraLarge = Self(.screenExtraLarge)
  public static let screenExtraExtraLarge = Self(.screenExtraExtraLarge)

  public init(integerLiteral value: Int) {
    self.storage = .rawValue(Double(value))
  }

  public init(floatLiteral value: Double) {
    self.storage = .rawValue(value)
  }

  fileprivate init(_ value: Storage) {
    self.storage = value
  }

  fileprivate enum Storage: Sendable {
    case rawValue(Double)
    case none
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case extraExtraLarge
    case extraExtraExtraLarge
    case fourXLarge
    case fiveXLarge
    case sixXLarge
    case sevenXLarge
    case eightXLarge
    case nineXLarge
    case full
    case min
    case max
    case fit
    case prose
    case screenSmall
    case screenMedium
    case screenLarge
    case screenExtraLarge
    case screenExtraExtraLarge
  }
  fileprivate let storage: Storage

  /// Returns the  closest Tailwind CSS sizing class.
  var tailwindSizingClass: String {
    switch storage {
    case .rawValue(let ptLength):
      return Self.pointToTailwindSizingClass(ptLength: ptLength)
    case .none: return "none"
    case .extraSmall: return "xs"
    case .small: return "sm"
    case .medium: return "md"
    case .large: return "lg"
    case .extraLarge: return "xl"
    case .extraExtraLarge: return "2xl"
    case .extraExtraExtraLarge: return "3xl"
    case .fourXLarge: return "4xl"
    case .fiveXLarge: return "5xl"
    case .sixXLarge: return "6xl"
    case .sevenXLarge: return "7xl"
    case .eightXLarge: return "8xl"
    case .nineXLarge: return "9xl"
    case .full: return "full"
    case .min: return "min"
    case .max: return "max"
    case .fit: return "fit"
    case .prose: return "prose"
    case .screenSmall: return "screen-sm"
    case .screenMedium: return "screen-md"
    case .screenLarge: return "screen-lg"
    case .screenExtraLarge: return "screen-xl"
    case .screenExtraExtraLarge: return "screen-2xl"
    }
  }

  /// Maps a point length to the closest Tailwind CSS sizing class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS sizing class.
  static func pointToTailwindSizingClass(ptLength: Double) -> String {
    let mapping: [(name: String, ptLength: Double)] = [
      ("0", 0),
      ("px", 1),
      ("0.5", 2),  // 0.125rem
      ("1", 4),    // 0.25rem
      ("1.5", 6),  // 0.375rem
      ("2", 8),    // 0.5rem
      ("2.5", 10), // 0.625rem
      ("3", 12),   // 0.75rem
      ("3.5", 14), // 0.875rem
      ("4", 16),   // 1rem
      ("5", 20),   // 1.25rem
      ("6", 24),   // 1.5rem
      ("7", 28),   // 1.75rem
      ("8", 32),   // 2rem
      ("9", 36),   // 2.25rem
      ("10", 40),  // 2.5rem
      ("11", 44),  // 2.75rem
      ("12", 48),  // 3rem
      ("14", 56),  // 3.5rem
      ("16", 64),  // 4rem
      ("20", 80),  // 5rem
      ("24", 96),  // 6rem
      ("28", 112), // 7rem
      ("32", 128), // 8rem
      ("36", 144), // 9rem
      ("40", 160), // 10rem
      ("44", 176), // 11rem
      ("48", 192), // 12rem
      ("52", 208), // 13rem
      ("56", 224), // 14rem
      ("60", 240), // 15rem
      ("64", 256), // 16rem
      ("72", 288), // 18rem
      ("80", 320), // 20rem
      ("96", 384)  // 24rem
    ]
    let closestClass = mapping.min { abs($0.ptLength - ptLength) < abs($1.ptLength - ptLength) }
    return closestClass?.name ?? "0"
  }
}
