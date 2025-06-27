/// A struct representing an offset value for layout purposes, with support
/// for both numerical values and predefined values.
@available(iOS 17.0, macOS 14.0, *)
public struct OffsetValue: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Sendable {
  /// A static instance representing the "full" placement value.
  public static let full = OffsetValue(.full)

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
    case full
  }
  fileprivate let storage: Storage

  /// Returns the value as the closest Tailwind CSS translation class.
  ///
  /// - Returns: The Tailwind CSS translation class string.
  fileprivate func toTailwindTranslationClass(context: String) -> String {
    switch storage {
    case .rawValue(let ptLength):
      if ptLength < 0 {
        return "-" + context + Self.pointToTailwindTranslationClass(ptLength: -ptLength)
      } else {
        return context + Self.pointToTailwindTranslationClass(ptLength: ptLength)
      }
    case .full: return context + "full"
    }
  }

  /// Maps a point length to the closest Tailwind CSS translation class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS translation class.
  static func pointToTailwindTranslationClass(ptLength: Double) -> String {
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
  /// Offset this view by the specified horizontal and vertical distances.
  ///
  /// - Parameters:
  ///   - x: The horizontal distance to offset this view.
  ///   - y: The vertical distance to offset this view.
  ///   - condition: The conditions in which these attributes should apply.
  ///
  /// - SeeAlso: Tailwind CSS' [translate](https://tailwindcss.com/docs/translate) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func offset(
    x: OffsetValue? = nil,
    y: OffsetValue? = nil,
    condition: Condition? = nil
  ) -> some View {
    var classNames: [String] = []
    if let x {
      classNames.append(x.toTailwindTranslationClass(context: "translate-x-"))
    }
    if let y {
      classNames.append(y.toTailwindTranslationClass(context: "translate-y-"))
    }
    return modifier(TailwindClassModifier(add: Set(classNames), condition: condition))
  }
}
