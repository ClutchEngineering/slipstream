import SwiftSoup

/// A view that represents a line break.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Text("Hello")
///     Linebreak()
///     Text("world!")
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`br`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-br-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Linebreak: View {
  /// Creates a Linebreak view.
  public init() {
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    _ = try container.appendElement("br")
  }
}
