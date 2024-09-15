/// A struct representing a margin value for layout purposes, with support
/// for both numerical values and the "auto" value.
@available(iOS 17.0, macOS 14.0, *)
public struct MarginValue {
  /// A static instance representing the "auto" margin value.
  public static let auto = MarginValue(.auto)

  fileprivate init(integerLiteral value: Int) {
    self.storage = .rawValue(Double(value))
  }

  fileprivate init(floatLiteral value: Double) {
    self.storage = .rawValue(value)
  }

  fileprivate init(_ value: Storage) {
    self.storage = value
  }

  fileprivate enum Storage {
    case rawValue(Double)
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

  /// Returns the margin value as the closest Tailwind CSS spacing class.
  ///
  /// - Returns: The Tailwind CSS spacing class string.
  fileprivate func toTailwindSpacingClass() -> String {
    switch storage {
    case .rawValue(let ptLength):
      return Edge.pointToTailwindSpacingClass(ptLength: ptLength)
    case .auto:
      return "auto"
    }
  }
}

extension View {
  /// Set the margin for specific edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to which margin should be applied.
  ///   - length: The size of the margin to apply, in points. If the margin is exactly between
  ///   two margin classes, then the smaller margin class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func margin(_ edges: Edge.Set = .all, _ length: MarginValue, condition: Condition? = nil) -> some View {
    let spacingClass = length.toTailwindSpacingClass()
    var classes = [String]()

    if Edge.Set.all.isSubset(of: edges) {
      classes = ["m-" + spacingClass]
    } else {
      if Edge.Set.horizontal.isSubset(of: edges) {
        classes.append("mx-" + spacingClass)
      } else {
        if edges.contains(.left) {
          classes.append("ml-" + spacingClass)
        }
        if edges.contains(.right) {
          classes.append("mr-" + spacingClass)
        }
      }
      if Edge.Set.vertical.isSubset(of: edges) {
        classes.append("my-" + spacingClass)
      } else {
        if edges.contains(.top) {
          classes.append("mt-" + spacingClass)
        }
        if edges.contains(.bottom) {
          classes.append("mb-" + spacingClass)
        }
      }
    }
    if length.isNegative {
      classes = classes.map { "-" + $0 }
    }
    return modifier(TailwindClassModifier(add: classes.joined(separator: " "), condition: condition))
  }

  /// Set the margin for specific edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to which margin should be applied.
  ///   - length: The size of the margin to apply, in points. If the margin is exactly between
  ///   two margin classes, then the smaller margin class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func margin(_ edges: Edge.Set, _ length: Double, condition: Condition? = nil) -> some View {
    margin(edges, MarginValue(floatLiteral: length), condition: condition)
  }

  /// Set the margin for specific edges.
  ///
  /// - Parameters:
  ///   - edges: The edges to which margin should be applied.
  ///   - length: The size of the margin to apply, in points. If the margin is exactly between
  ///   two margin classes, then the smaller margin class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func margin(_ edges: Edge.Set, _ length: Int, condition: Condition? = nil) -> some View {
    margin(edges, MarginValue(integerLiteral: length), condition: condition)
  }

  /// Set the margin for all edges.
  ///
  /// - Parameters:
  ///   - length: The size of the margin to apply, in points. If the margin is exactly between
  ///   two margin classes, then the smaller margin class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func margin(_ length: Double, condition: Condition? = nil) -> some View {
    margin(.all, MarginValue(floatLiteral: length), condition: condition)
  }

  /// Set the margin for all edges.
  ///
  /// - Parameters:
  ///   - length: The size of the margin to apply, in points. If the margin is exactly between
  ///   two margin classes, then the smaller margin class will be used.
  ///   - condition: An optional Tailwind condition defining when to apply this modifier.
  ///
  /// - SeeAlso: Tailwind CSS' [`margin`](https://tailwindcss.com/docs/margin) documentation.
  @available(iOS 17.0, macOS 14.0, *)
  public func margin(_ length: Int, condition: Condition? = nil) -> some View {
    margin(.all, MarginValue(integerLiteral: length), condition: condition)
  }
}
