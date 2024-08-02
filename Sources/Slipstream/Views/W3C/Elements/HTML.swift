import SwiftSoup

/// A view that represents the root of an HTML document.
///
/// Every web page starts with an HTML view.
///
/// ```swift
/// struct MySite: View {
///   var body: some View {
///     HTML {
///       Head {
///       }
///       Body {
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`html`](https://www.w3.org/TR/2012/WD-html-markup-20121025/html.html#html) specification.
///
/// ## See Also
///
/// - ``View/language(_:)``
@available(iOS 17.0, macOS 14.0, *)
public struct HTML<Content>: View where Content: View {
  /// Creates an HTML view.
  ///
  /// - Parameter content: Should include a single ``Head`` view followed by a single ``Body`` view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("html")
    try self.content().render(element, environment: environment)
  }

  private let content: () -> Content
}
