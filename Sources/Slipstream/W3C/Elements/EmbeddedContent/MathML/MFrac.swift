import SwiftSoup

/// A view that represents a MathML `<mfrac>` element for fractions.
///
/// The `<mfrac>` element is used to display fractions with a numerator and denominator
/// separated by a horizontal line.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MFrac {
///           MI("a")
///           MI("b")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mfrac](https://www.w3.org/TR/MathML3/chapter3.html#presm.mfrac) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MFrac<Content>: View where Content: View {
  /// Creates an MFrac element.
  ///
  /// - Parameter content: The numerator and denominator expressions (must contain exactly two children).
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
    self.linethicknessValue = nil
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("mfrac")
    if let linethickness = linethicknessValue {
      try element.attr("linethickness", linethickness)
    }
    try self.content().render(element, environment: environment)
  }

  /// Sets the thickness of the fraction line.
  ///
  /// - Parameter thickness: The line thickness (e.g., "thin", "medium", "thick", or a length value)
  /// - Returns: A new MFrac with the specified line thickness.
  public func linethickness(_ thickness: String) -> MFrac {
    var newFrac = self
    newFrac.linethicknessValue = thickness
    return newFrac
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private var linethicknessValue: String?
}
