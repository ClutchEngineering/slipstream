import SwiftSoup

/// Represents an SVG `<text>` element for rendering text within SVG graphics.
///
/// SVGText allows you to position and style text within an SVG coordinate system.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       SVG(viewBox: "0 0 100 50") {
///         SVGText("Hello World", x: "50", y: "25")
///           .fontSize("16")
///           .textAnchor("middle")
///           .fill("#333")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [text](https://svgwg.org/svg2-draft/text.html#TextElement) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SVGText: View {
  private let text: String
  private let x: String
  private let y: String
  private var fontSizeValue: String?
  private var fontFamilyValue: String?
  private var fontWeightValue: String?
  private var textAnchorValue: String?
  private var fillValue: String?
  private var strokeValue: String?
  private var strokeWidthValue: String?

  /// Creates an SVG text element.
  /// - Parameters:
  ///   - text: The text content to display
  ///   - x: The x-coordinate of the text starting point
  ///   - y: The y-coordinate of the text baseline
  public init(_ text: String, x: String = "0", y: String = "0") {
    self.text = text
    self.x = x
    self.y = y
  }

  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("text")
    try element.attr("x", x)
    try element.attr("y", y)
    try element.text(text)
    
    if let fontSize = fontSizeValue {
      try element.attr("font-size", fontSize)
    }
    if let fontFamily = fontFamilyValue {
      try element.attr("font-family", fontFamily)
    }
    if let fontWeight = fontWeightValue {
      try element.attr("font-weight", fontWeight)
    }
    if let textAnchor = textAnchorValue {
      try element.attr("text-anchor", textAnchor)
    }
    if let fill = fillValue {
      try element.attr("fill", fill)
    }
    if let stroke = strokeValue {
      try element.attr("stroke", stroke)
    }
    if let strokeWidth = strokeWidthValue {
      try element.attr("stroke-width", strokeWidth)
    }
  }

  /// Sets the font size of the text.
  /// - Parameter size: Font size (e.g., "16", "1.2em", "12px")
  /// - Returns: A new SVGText with the specified font size.
  public func fontSize(_ size: String) -> SVGText {
    var newText = self
    newText.fontSizeValue = size
    return newText
  }

  /// Sets the font family of the text.
  /// - Parameter family: Font family name (e.g., "Arial", "serif", "monospace")
  /// - Returns: A new SVGText with the specified font family.
  public func fontFamily(_ family: String) -> SVGText {
    var newText = self
    newText.fontFamilyValue = family
    return newText
  }

  /// Sets the font weight of the text.
  /// - Parameter weight: Font weight (e.g., "normal", "bold", "400", "700")
  /// - Returns: A new SVGText with the specified font weight.
  public func fontWeight(_ weight: String) -> SVGText {
    var newText = self
    newText.fontWeightValue = weight
    return newText
  }

  /// Sets the text anchor position.
  /// - Parameter anchor: Text anchor ("start", "middle", "end")
  /// - Returns: A new SVGText with the specified text anchor.
  public func textAnchor(_ anchor: String) -> SVGText {
    var newText = self
    newText.textAnchorValue = anchor
    return newText
  }

  /// Sets the fill color of the text.
  /// - Parameter color: Fill color (e.g., "#333", "red", "rgb(255,0,0)")
  /// - Returns: A new SVGText with the specified fill color.
  public func fill(_ color: String) -> SVGText {
    var newText = self
    newText.fillValue = color
    return newText
  }

  /// Sets the stroke color of the text.
  /// - Parameter color: Stroke color (e.g., "#333", "red", "rgb(255,0,0)")
  /// - Returns: A new SVGText with the specified stroke color.
  public func stroke(_ color: String) -> SVGText {
    var newText = self
    newText.strokeValue = color
    return newText
  }

  /// Sets the stroke width of the text.
  /// - Parameter width: Stroke width (e.g., "1", "2px", "0.5")
  /// - Returns: A new SVGText with the specified stroke width.
  public func strokeWidth(_ width: String) -> SVGText {
    var newText = self
    newText.strokeWidthValue = width
    return newText
  }
}
