import Foundation

import SwiftSoup

/// A view that defines an image map with clickable areas.
///
/// The `<map>` element is used with ``Area`` elements to define clickable regions
/// on an image. Each area within the map can link to different destinations. Use the
/// map's name with an ``Image``'s `usemap` attribute to associate them.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Image(URL(string: "/worldmap.png")!)
///         .attribute("usemap", "#worldmap")
///       Map("worldmap") {
///         Area(
///           shape: .rectangle(x1: 0, y1: 0, x2: 100, y2: 100),
///           destination: URL(string: "/europe")
///         )
///         .accessibilityLabel("Europe")
///         Area(
///           shape: .circle(x: 200, y: 200, radius: 50),
///           destination: URL(string: "/asia")
///         )
///         .accessibilityLabel("Asia")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`map`](https://html.spec.whatwg.org/multipage/image-maps.html#the-map-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Map<Content>: View where Content: View {
  /// Creates a Map view.
  ///
  /// - Parameters:
  ///   - name: The name of the map, referenced by images using the `usemap` attribute.
  ///   - content: The content of the map, typically containing ``Area`` elements.
  public init(
    _ name: String,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.name = name
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("map")
    try element.attr("name", name)
    try self.content().render(element, environment: environment)
  }

  private let name: String
  @ViewBuilder private let content: @Sendable () -> Content
}
