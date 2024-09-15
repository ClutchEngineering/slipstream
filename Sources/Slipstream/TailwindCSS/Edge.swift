/// A structure that represents the edges of a rectangle, used for specifying
/// which sides to apply modifications to, such as padding or margin.
///
/// You'll typically work with a set of edges using the ``Edge/Set`` type.
@available(iOS 17.0, macOS 14.0, *)
public enum Edge: Int8, CaseIterable {
  /// The top edge of a rectangle.
  case top    = 0b0000_0001

  /// The left edge of a rectangle.
  case left   = 0b0000_0010

  /// The bottom edge of a rectangle.
  case bottom = 0b0000_0100

  /// The right edge of a rectangle.
  case right  = 0b0000_1000

  /// A set of edges.
  ///
  /// Usage:
  ///
  /// ```swift
  /// let edges: Edge.Set = [.top, .left]
  /// ```
  @available(iOS 17.0, macOS 14.0, *)
  public struct Set: OptionSet {
    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = Edge.Set

    /// The raw integer value representing the edge. Used internally to distinguish
    /// different edges and combinations of edges.
    public let rawValue: Int8

    /// Creates a new `Edge` instance from the given raw value.
    ///
    /// - Parameter rawValue: The raw integer value representing the edge.
    public init(rawValue: Int8) {
      self.rawValue = rawValue
    }

    /// Creates set of edges containing only the specified edge.
    public init(_ e: Edge) {
      self.rawValue = e.rawValue
    }

    /// The top edge of a rectangle.
    public static let top = Edge.Set(.top)

    /// The left edge of a rectangle.
    public static let left = Edge.Set(.left)

    /// The bottom edge of a rectangle.
    public static let bottom = Edge.Set(.bottom)

    /// The right edge of a rectangle.
    public static let right = Edge.Set(.right)

    /// A convenience option representing both the left and right edges.
    public static let horizontal: Edge.Set = [.left, .right]

    /// A convenience option representing both the top and bottom edges.
    public static let vertical: Edge.Set = [.top, .bottom]

    /// A convenience option representing all edges (top, left, bottom, right).
    public static let all: Edge.Set = [.top, .left, .bottom, .right]
  }

  /// Maps a point length to the closest Tailwind CSS spacing class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS spacing class.
  static func pointToTailwindSpacingClass(ptLength: Double) -> String {
    let ptLength = abs(ptLength)

    // Tailwind spacing classes and their corresponding sizes in points.
    let mapping: [(name: String, ptLength: Double)] = [
      ("0", 0),    // 0pt
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

    // Find the closest matching spacing class
    let closestClass = mapping.min { abs($0.ptLength - ptLength) < abs($1.ptLength - ptLength) }
    return closestClass?.name ?? "0"
  }
}
