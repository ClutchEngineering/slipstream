/// A structure that represents the edges of a rectangle, used for specifying
/// which sides to apply modifications to, such as padding or margin.
///
/// This struct conforms to the `OptionSet` protocol, allowing for the combination
/// of multiple edges using set operations.
///
/// Usage:
///
/// ```swift
/// let edges: Edge = [.top, .left]
/// ```
public enum Edge: Int8, CaseIterable {
  /// The top edge of a rectangle.
  case top = 0b0000_0001

  /// The left edge of a rectangle.
  case left = 0b0000_0010

  /// The bottom edge of a rectangle.
  case bottom = 0b0000_0100

  /// The right edge of a rectangle.
  case right = 0b0000_1000

  /// A set of edges.
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
}
