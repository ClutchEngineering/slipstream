import SwiftSoup

/// A view that represents an SVG group container.
///
/// SVGGroup is used to group related SVG elements and apply common styling or transformations.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 100") {
///         SVGGroup {
///           SVGPath("M10,10 L50,50")
///           SVGPath("M50,50 L90,10")
///         }
///         .transform("translate(10,20) scale(1.5)")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [g](https://svgwg.org/svg2-draft/struct.html#GElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGGroup<Content>: View where Content: View {
  /// Creates an SVG group element.
  ///
  /// - Parameter content: The SVG elements to group together.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
    self.transformValue = nil
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("g")
    if let transformValue = transformValue {
      try element.attr("transform", transformValue)
    }
    try self.content().render(element, environment: environment)
  }

  /// Applies a transform attribute to this SVG group.
  ///
  /// - Parameter transform: SVG transform string (e.g., "translate(x,y)", "rotate(angle)", "scale(x,y)").
  /// - Returns: A new SVGGroup with the specified transform applied.
  public func transform(_ transform: String) -> SVGGroup {
    var newGroup = self
    newGroup.transformValue = transform
    return newGroup
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private var transformValue: String?
}
