/// A representation of a Tailwind CSS color palette.
///
/// - SeeAlso: Tailwind CSS' [`color palettes`](https://tailwindcss.com/docs/customizing-colors) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum ColorPalette: String, Sendable {

  // MARK: - Grays

  case slate
  case gray
  case zinc
  case neutral
  case stone

  // MARK: - Tones, in order of the rainbow

  case red
  case orange
  case amber
  case yellow
  case lime
  case green
  case emerald
  case teal
  case cyan
  case sky
  case blue
  case indigo
  case violet
  case purple
  case fuchsia
  case pink
  case rose

  /// Chooses the closest tailwind color stop for the given darkness value.
  func closestTailwindColorStop(for darkness: Int) -> String {
    // Define the range of Tailwind CSS color palette numbers
    let paletteNumbers = [0, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950, 1000]

    // Find the closest palette number
    guard let closest = paletteNumbers.min(by: { abs($0 - darkness) < abs($1 - darkness) }) else {
      return "500" // Default to middle value if no closest found
    }

    if closest == 0 {
      return "white"
    } else if closest == 1000 {
      return "black"
    }
    return "\(rawValue)-\(closest)"
  }
}
