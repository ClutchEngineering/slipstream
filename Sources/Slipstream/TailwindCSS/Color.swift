/// A representation of a color.
///
/// - SeeAlso: Tailwind CSS' [`color palettes`](https://tailwindcss.com/docs/customizing-colors) documentation.
@available(iOS 17.0, macOS 14.0, *)
public struct Color {
  public static let black = Color(.black)
  public static let white = Color(.white)
  public static let inherit = Color(.inherit)
  public static let current = Color(.current)
  public static let transparent = Color(.transparent)

  public static func palette(_ colorPalette: ColorPalette, darkness: Int) -> Self {
    return self.init(colorPalette, darkness: darkness)
  }

  /// Creates a Color instance using a Tailwind CSS palette instance.
  public init(_ colorPalette: ColorPalette, darkness: Int) {
    self.storage = .palette(colorPalette, darkness: darkness)
    self.opacity = 1
  }

  /// Multiplies the opacity of the color by the given amount.
  public func opacity(_ opacity: Double) -> Self {
    var copy = self
    copy.opacity *= opacity
    return copy
  }

  init(_ value: Storage) {
    self.storage = value
    self.opacity = 1
  }

  enum Storage {
    case black
    case white
    case inherit
    case current
    case transparent
    case palette(ColorPalette, darkness: Int)
  }
  private let storage: Storage
  private var opacity: Double

  /// Returns the Tailwind CSS color class for this color.
  func toTailwindColorClass() -> String {
    if opacity < 1 {
      return colorClass + "/" + opacityClass
    }
    return colorClass
  }

  /// Returns the Tailwind CSS color class for this color.
  private var colorClass: String {
    switch storage {
    case .black: return "black"
    case .white: return "white"
    case .inherit: return "inherit"
    case .current: return "current"
    case .transparent: return "transparent"
    case .palette(let colorPalette, let darkness):
      return colorPalette.closestTailwindColorStop(for: darkness)
    }
  }

  /// Maps the opacity to the closest Tailwind CSS opacity class.
  ///
  /// - Parameter size: The size in points to be mapped.
  /// - Returns: The Tailwind CSS placement class.
  var opacityClass: String {
    let mapping: [(name: String, opacity: Double)] = [
      ("0", 0.0),
      ("5", 0.05),
      ("10", 0.10),
      ("15", 0.15),
      ("20", 0.20),
      ("25", 0.25),
      ("30", 0.30),
      ("35", 0.35),
      ("40", 0.40),
      ("45", 0.45),
      ("50", 0.50),
      ("55", 0.55),
      ("60", 0.60),
      ("65", 0.65),
      ("70", 0.70),
      ("75", 0.75),
      ("80", 0.80),
      ("85", 0.85),
      ("90", 0.90),
      ("95", 0.95),
      ("100", 0.100),
    ]
    let closestClass = mapping.min { abs($0.opacity - opacity) < abs($1.opacity - opacity) }
    return closestClass?.name ?? "0"
  }
}
