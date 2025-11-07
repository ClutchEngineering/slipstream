/// Expects an element with the target ID to appear in the current document.
///
/// The `Expect` view renders a `<link rel="expect">` element in HTML,
/// which indicates that an element with the specified ID is expected to appear.
///
/// ```swift
/// struct MySiteHead: View {
///   var body: some View {
///     Head {
///       Expect("#main-content")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C Specification: [Link type "expect"](https://html.spec.whatwg.org/multipage/links.html#link-type-expect)
@available(iOS 17.0, macOS 14.0, *)
public struct Expect: View {
  /// Creates an expect link.
  ///
  /// - Parameters:
  ///   - href: The fragment identifier or URL of the expected element.
  public init(_ href: String?) {
    self.href = href
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let href else { return }
    let element = try container.appendElement("link")
    try element.attr("rel", "expect")
    try element.attr("href", href)
  }

  private let href: String?
}
