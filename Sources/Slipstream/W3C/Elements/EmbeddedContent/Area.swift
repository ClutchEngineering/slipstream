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
///     //   Area(shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100),
///     //        destination: URL(string: "/section1"))
///     //     .accessibilityLabel("Section 1")
///     // }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`area`](https://html.spec.whatwg.org/multipage/image-maps.html#the-area-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Area: View {
  /// The shape of a clickable area with its associated coordinates.
  public enum Shape: Sendable {
    /// A circular region defined by center coordinates and radius.
    case circle(x: Int, y: Int, radius: Int)
    /// The default area (entire image).
    case `default`
    /// A polygonal region defined by a series of coordinate pairs.
    case polygon(coordinates: [(x: Int, y: Int)])
    /// A rectangular region defined by top-left and bottom-right corners.
    case rectangle(x1: Int, y1: Int, x2: Int, y2: Int)

    fileprivate var htmlShapeName: String? {
      switch self {
      case .circle: return "circle"
      case .default: return nil
      case .polygon: return "poly"
      case .rectangle: return "rect"
      }
    }

    fileprivate var coordinatesString: String? {
      switch self {
      case .circle(let x, let y, let radius):
        return "\(x),\(y),\(radius)"
      case .default:
        return nil
      case .polygon(let coords):
        return coords.map { "\($0.x),\($0.y)" }.joined(separator: ",")
      case .rectangle(let x1, let y1, let x2, let y2):
        return "\(x1),\(y1),\(x2),\(y2)"
      }
    }
  }

  /// Creates an Area view.
  ///
  /// - Parameters:
  ///   - shape: The shape of the clickable area with its coordinates.
  ///   - destination: The URL to navigate to when the area is clicked.
  ///   - target: Where to display the linked URL (e.g., "_blank", "_self").
  public init(
    shape: Shape = .default,
    destination: URL? = nil,
    target: String? = nil
  ) {
    self.shape = shape
    self.destination = destination
    self.target = target
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("area")

    if let shapeName = shape.htmlShapeName {
      try element.attr("shape", shapeName)
    }

    if let coordinates = shape.coordinatesString {
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
  private let destination: URL?
  private let target: String?
}
