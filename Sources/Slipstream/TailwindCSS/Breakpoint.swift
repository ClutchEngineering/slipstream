/// Default Tailwind CSS breakpoints.
///
/// - SeeAlso: Tailwind CSS' [`responsive design`](https://tailwindcss.com/docs/responsive-design) documentation.
@available(iOS 17.0, macOS 14.0, *)
public enum Breakpoint: String {
  case small = "sm"
  case medium = "md"
  case large = "lg"
  case extraLarge = "xl"
  case extraExtraLarge = "2xl"
}
