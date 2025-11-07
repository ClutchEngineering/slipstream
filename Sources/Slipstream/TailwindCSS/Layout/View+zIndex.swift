/// A struct representing a z-index value for stacking order, with support
/// for both numerical values and the "auto" value.
@available(iOS 17.0, macOS 14.0, *)
public struct ZIndexValue: Sendable {
  /// A static instance representing the "auto" z-index value.
  public static let auto = ZIndexValue(.auto)

  /// Create a z-index value from an integer literal.
  public init(integerLiteral value: Int) {
    self.storage = .rawValue(value)
  }

  fileprivate init(_ value: Storage) {
    self.storage = value
  }

  fileprivate enum Storage: Sendable {
    case rawValue(Int)
    case auto
  }
  fileprivate let storage: Storage

  var isNegative: Bool {
    switch storage {
    case .rawValue(let value):
      return value < 0
    case .auto:
      return false
    }
  }

  /// Returns the z-index value as the closest Tailwind CSS z-index class.
  ///
  /// - Returns: The Tailwind CSS z-index class string.
  fileprivate func toTailwindZIndexClass() -> String {
    switch storage {
    case .rawValue(let zIndex):
      return Self.zIndexToTailwindZIndexClass(zIndex: zIndex)
    case .auto:
      return "auto"
    }
  }

  /// Maps a z-index value to the closest Tailwind CSS z-index class.
  ///
  /// - Parameter zIndex: The z-index value to be mapped.
  /// - Returns: The Tailwind CSS z-index class suffix.
  private static func zIndexToTailwindZIndexClass(zIndex: Int) -> String {
    let absZIndex = abs(zIndex)
    let mapping: [(name: String, zIndex: Int)] = [
      ("0", 0),
      ("10", 10),
      ("20", 20),
      ("30", 30),
      ("40", 40),
      ("50", 50),
    ]
    let closestClass = mapping.min { abs($0.zIndex - absZIndex) < abs($1.zIndex - absZIndex) }
    return closestClass?.name ?? "0"
  }
}

extension ZIndexValue: ExpressibleByIntegerLiteral {}

extension View {
  /// Sets the z-index (stack order) of the view.
  ///
  /// Use z-index to control the vertical stacking order of elements that overlap.
  /// Higher z-index values appear on top of elements with lower z-index values.
  ///
  /// ```swift
  /// Div {
  ///   Text("Background")
  /// }
  /// .zIndex(10)
  ///
  /// Div {
  ///   Text("Foreground")
  /// }
  /// .zIndex(20)
  /// ```
  ///
  /// - Parameters:
  ///   - zIndex: The z-index value to apply. Common values are 0, 10, 20, 30, 40, and 50.
  ///   You can also use negative values. Use `.auto` for automatic stacking order.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [z-index](https://tailwindcss.com/docs/z-index) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func zIndex(_ zIndex: ZIndexValue, condition: Condition? = nil) -> some View {
    let zIndexClass = zIndex.toTailwindZIndexClass()
    let className: String
    if zIndex.isNegative {
      className = "-z-" + zIndexClass
    } else {
      className = "z-" + zIndexClass
    }
    return modifier(TailwindClassModifier(add: className, condition: condition))
  }

  /// Sets the z-index (stack order) of the view.
  ///
  /// Use z-index to control the vertical stacking order of elements that overlap.
  /// Higher z-index values appear on top of elements with lower z-index values.
  ///
  /// ```swift
  /// Div {
  ///   Text("Background")
  /// }
  /// .zIndex(10)
  ///
  /// Div {
  ///   Text("Foreground")
  /// }
  /// .zIndex(20)
  /// ```
  ///
  /// - Parameters:
  ///   - zIndex: The z-index value to apply. Common values are 0, 10, 20, 30, 40, and 50.
  ///   You can also use negative values.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [z-index](https://tailwindcss.com/docs/z-index) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func zIndex(_ zIndex: Int, condition: Condition? = nil) -> some View {
    self.zIndex(ZIndexValue(integerLiteral: zIndex), condition: condition)
  }
}
