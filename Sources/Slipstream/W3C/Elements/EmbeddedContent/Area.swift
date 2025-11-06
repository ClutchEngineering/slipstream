import Foundation

import SwiftSoup

/// A view that defines a hyperlink within an image map.
///
/// The `Area` element is used within a `<map>` element to define clickable
/// regions on an image. Each area can link to different destinations.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Image(URL(string: "/map.png"))
///       .attribute("usemap", "#sitemap")
///     // Typically used within a Map element:
///     // Map("sitemap") {
///     //   Area(
///     //     shape: .rectangle,
///     //     coordinates: "0,0,100,100",
///     //     destination: URL(string: "/section1"),
///     //     alternativeText: "Section 1"
///     //   )
///     // }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`area`](https://html.spec.whatwg.org/multipage/image-maps.html#the-area-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Area: View {
  /// The shape of a clickable area.
  public enum Shape: String {
    /// A circular region.
    case circle
    /// The default area (entire image).
    case `default`
    /// A polygonal region.
    case polygon = "poly"
    /// A rectangular region.
    case rectangle = "rect"
  }

  /// Creates an Area view.
  ///
  /// - Parameters:
  ///   - shape: The shape of the clickable area.
  ///   - coordinates: The coordinates defining the shape. Format depends on the shape:
  ///     - `.circle`: "x,y,radius"
  ///     - `.rectangle`: "x1,y1,x2,y2"
  ///     - `.polygon`: "x1,y1,x2,y2,...,xn,yn"
  ///   - destination: The URL to navigate to when the area is clicked.
  ///   - alternativeText: Text alternative for the area (required for accessibility).
  ///   - target: Where to display the linked URL (e.g., "_blank", "_self").
  public init(
    shape: Shape = .default,
    coordinates: String? = nil,
    destination: URL? = nil,
    alternativeText: String,
    target: String? = nil
  ) {
    self.shape = shape
    self.coordinates = coordinates
    self.destination = destination
    self.alternativeText = alternativeText
    self.target = target
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("area")

    try element.attr("alt", alternativeText)

    if shape != .default {
      try element.attr("shape", shape.rawValue)
    }

    if let coordinates {
      try element.attr("coords", coordinates)
    }

    if let destination {
      try element.attr("href", destination.absoluteString)
    }

    if let target {
      try element.attr("target", target)
    }
  }

  private let shape: Shape
  private let coordinates: String?
  private let destination: URL?
  private let alternativeText: String
  private let target: String?
}
