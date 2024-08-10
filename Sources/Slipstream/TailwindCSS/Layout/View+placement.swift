/// A struct representing a placement value for layout purposes, with support
/// for both numerical values and predefined values.
@available(iOS 17.0, macOS 14.0, *)
public struct PlacementValue: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
  /// A static instance representing the "auto" placement value.
  public static let auto = PlacementValue(.auto)

  /// A static instance representing the "full" placement value.
  public static let full = PlacementValue(.full)

  public init(integerLiteral value: Int) {
    self.storage = .rawValue(Double(value))
  }

  public init(floatLiteral value: Double) {
    self.storage = .rawValue(value)
  }

  fileprivate init(_ value: Storage) {
    self.storage = value
  }

  fileprivate enum Storage {
    case rawValue(Double)
    case auto
    case full
  }
  fileprivate let storage: Storage

  /// Returns the value as the closest Tailwind CSS placement class.
  ///
  /// - Returns: The Tailwind CSS placement class string.
  fileprivate func toTailwindSpacingClass() -> String {
    switch storage {
    case .rawValue(let ptLength):
      return Self.pointToTailwindPlacementClass(ptLength: ptLength)
    case .auto: return "auto"
    case .full: return "full"
    }
  }

  /// Maps a point length to the closest Tailwind CSS placement class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS placement class.
  static func pointToTailwindPlacementClass(ptLength: Double) -> String {
    let mapping: [(name: String, ptLength: Double)] = [
      ("0", 0),

      ("1/2", 1 / 2),

      ("1/3", 1 / 3),
      ("2/3", 2 / 3),

      ("1/4", 1 / 4),
      ("2/4", 2 / 4),
      ("3/4", 3 / 4),

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

extension View {
  /// Changes the placement of positioned views.
  ///
  /// - Parameters:
  ///   - left: If provided, sets the view's left-edge placement.
  ///   - right: If provided, sets the view's right-edge placement.
  ///   - top: If provided, sets the view's top-edge placement.
  ///   - bottom: If provided, sets the view's bottom-edge placement.
  ///   - condition: The conditions in which these attributes should apply.
  ///
  /// - SeeAlso: Tailwind CSS' [top / right / bottom / left](https://tailwindcss.com/docs/top-right-bottom-left) documentation.
  ///
  /// ## See Also
  ///
  /// - ``View/position(_:condition:)``
  @available(iOS 17.0, macOS 14.0, *)
  public func placement(
    left: PlacementValue? = nil,
    right: PlacementValue? = nil,
    top: PlacementValue? = nil,
    bottom: PlacementValue? = nil,
    condition: Condition? = nil
  ) -> some View {
    var classNames: [String] = []
    if let left {
      classNames.append("left-" + left.toTailwindSpacingClass())
    }
    if let right {
      classNames.append("right-" + right.toTailwindSpacingClass())
    }
    if let top {
      classNames.append("top-" + top.toTailwindSpacingClass())
    }
    if let bottom {
      classNames.append("bottom-" + bottom.toTailwindSpacingClass())
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }

  /// Changes the inset of positioned views.
  ///
  /// - Parameters:
  ///   - inset: If provided, sets the view's inset from all edges.
  ///   - condition: The conditions in which these attributes should apply.
  ///
  /// - SeeAlso: Tailwind CSS' [top / right / bottom / left](https://tailwindcss.com/docs/top-right-bottom-left) documentation.
  ///
  /// ## See Also
  ///
  /// - ``View/position(_:condition:)``
  @available(iOS 17.0, macOS 14.0, *)
  public func placement(inset: PlacementValue, condition: Condition? = nil) -> some View {
    return modifier(TailwindClassModifier(add: "inset-" + inset.toTailwindSpacingClass(), condition: condition))
  }

  /// Changes the axis-aligned inset of positioned views.
  ///
  /// - Parameters:
  ///   - x: If provided, sets the view's inset from its horizontal edges.
  ///   - y: If provided, sets the view's inset from its vertical edges.
  ///   - condition: The conditions in which these attributes should apply.
  ///
  /// - SeeAlso: Tailwind CSS' [top / right / bottom / left](https://tailwindcss.com/docs/top-right-bottom-left) documentation.
  ///
  /// ## See Also
  ///
  /// - ``View/position(_:condition:)``
  @available(iOS 17.0, macOS 14.0, *)
  public func placement(x: PlacementValue? = nil, y: PlacementValue? = nil, condition: Condition? = nil) -> some View {
    var classNames: [String] = []
    if let x {
      classNames.append("inset-x-" + x.toTailwindSpacingClass())
    }
    if let y {
      classNames.append("inset-y-" + y.toTailwindSpacingClass())
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }
}
