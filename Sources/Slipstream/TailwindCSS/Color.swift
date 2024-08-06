/// A representation of a color.
@available(iOS 17.0, macOS 14.0, *)
public struct Color {
  public static let black = Color(.black)
  public static let white = Color(.white)

  public static func palette(_ colorPalette: ColorPalette, darkness: Int) -> Self {
    return self.init(colorPalette, darkness: darkness)
  }

  /// Creates a Color instance using a Tailwind CSS palette instance.
  public init(_ colorPalette: ColorPalette, darkness: Int) {
    self.storage = .palette(colorPalette, darkness: darkness)
  }

  init(_ value: Storage) {
    self.storage = value
  }

  enum Storage {
    case black
    case white
    case palette(ColorPalette, darkness: Int)
  }
  private let storage: Storage

  /// Returns the Tailwind CSS color class for this color.
  func toTailwindColorClass() -> String {
    switch storage {
    case .black:
      return "black"
    case .white:
      return "white"
    case .palette(let colorPalette, let darkness):
      return colorPalette.closestTailwindColorStop(for: darkness)
    }
  }
}
