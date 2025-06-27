/// A struct representing a frame height value for sizing purposes, with support
/// for both numerical values and Tailwind CSS semantic values.
@available(iOS 17.0, macOS 14.0, *)
public struct FrameHeightValue: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, Sendable {
  /// A static instance representing the "auto" frame value.
  public static let auto = Self(.auto)
  public static let full = Self(.full)
  public static let screen = Self(.screen)

  /// Sets a view's height to the smallest possible height of the viewport.
  public static let svh = Self(.svh)

  /// Sets a view's height to the largest possible height of the viewport.
  public static let lvh = Self(.lvh)

  /// Sets a view's height to span the entire height of the viewport and
  /// changes as the browser UI expands or contracts.
  public static let dvh = Self(.dvh)

  public static let min = Self(.min)
  public static let max = Self(.max)
  public static let fit = Self(.fit)

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
    case auto
    case full
    case screen
    case svh
    case lvh
    case dvh
    case min
    case max
    case fit
  }
  fileprivate let storage: Storage

  /// Returns the  closest Tailwind CSS sizing class.
  var tailwindSizingClass: String {
    switch storage {
    case .rawValue(let ptLength):
      return Self.pointToTailwindSizingClass(ptLength: ptLength)
    case .auto: return "auto"
    case .full: return "full"
    case .screen: return "screen"
    case .svh: return "svh"
    case .lvh: return "lvh"
    case .dvh: return "dvh"
    case .min: return "min"
    case .max: return "max"
    case .fit: return "fit"
    }
  }

  /// Maps a point length to the closest Tailwind CSS sizing class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS sizing class.
  static func pointToTailwindSizingClass(ptLength: Double) -> String {
    let mapping: [(name: String, ptLength: Double)] = [
      ("0", 0),

      ("1/2", 1 / 2),

      ("1/3", 1 / 3),
      ("2/3", 2 / 3),

      ("1/4", 1 / 4),
      ("2/4", 2 / 4),
      ("3/4", 3 / 4),

      ("1/5", 1 / 5),
      ("2/5", 2 / 5),
      ("3/5", 3 / 5),
      ("4/5", 4 / 5),

      ("1/6", 1 / 6),
      ("2/6", 2 / 6),
      ("3/6", 3 / 6),
      ("4/6", 4 / 6),
      ("5/6", 5 / 6),

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
