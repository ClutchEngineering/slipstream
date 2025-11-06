import SwiftSoup

/// A view that represents an external resource, which can be treated as an image, a nested browsing context, or a plugin.
///
/// The Object element represents an external resource such as an image, PDF document,
/// video, or plugin. It provides a fallback mechanism through its content for browsers
/// that don't support the specified resource.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Object(
///         data: URL(string: "/media/document.pdf"),
///         type: "application/pdf",
///         width: 600,
///         height: 400
///       ) {
///         Paragraph("Your browser doesn't support embedded PDFs.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`object`](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#the-object-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Object<Content>: View where Content: View {
  /// Creates an Object view with the specified resource and attributes.
  ///
  /// - Parameters:
  ///   - data: The URL of the resource.
  ///   - type: The MIME type of the resource.
  ///   - name: The name of the nested browsing context.
  ///   - width: The width of the object in pixels.
  ///   - height: The height of the object in pixels.
  ///   - content: Fallback content for browsers that don't support the object.
  public init(
    data: URL? = nil,
    type: String? = nil,
    name: String? = nil,
    width: Int? = nil,
    height: Int? = nil,
    @ViewBuilder content: @escaping @Sendable () -> Content = { EmptyView() }
  ) {
    self.data = data
    self.type = type
    self.name = name
    self.width = width
    self.height = height
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("object")

    if let data {
      try element.attr("data", data.absoluteString)
    }

    if let type {
      try element.attr("type", type)
    }

    if let name {
      try element.attr("name", name)
    }

    if let width {
      try element.attr("width", String(width))
    }

    if let height {
      try element.attr("height", String(height))
    }

    try self.content().render(element, environment: environment)
  }

  private let data: URL?
  private let type: String?
  private let name: String?
  private let width: Int?
  private let height: Int?
  @ViewBuilder private let content: @Sendable () -> Content
}
