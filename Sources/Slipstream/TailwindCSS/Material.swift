/// Constants that define a background material type.
///
/// - SeeAlso: Tailwind CSS' [`backdrop blur`](https://tailwindcss.com/docs/backdrop-blur) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Material: String {
  case ultraThin = "-sm"
  case thin = ""
  case regular = "-md"
  case thick = "-lg"
  case ultraThick = "-xl"

  // MARK: Tailwind CSS-specific filters

  case ultraUltraThick = "-2xl"
  case ultraUltraUltraThick = "-3xl"
}
