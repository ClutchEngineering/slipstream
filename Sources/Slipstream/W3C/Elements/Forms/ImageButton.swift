import SwiftSoup

/// A graphical submit button.
///
/// An image button is a submit button that uses an image instead of text.
/// When clicked, it submits the form and also sends the x and y coordinates
/// of where the user clicked within the image.
///
/// ```swift
/// Form(action: "/submit", method: .post) {
///   TextField("Enter your name", name: "username")
///   ImageButton(src: "/images/submit.png", alt: "Submit")
/// }
/// ```
///
/// - SeeAlso: W3C [input type="image"](https://html.spec.whatwg.org/multipage/input.html#image-button-state-(type=image)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct ImageButton: View {
  /// Creates an image button.
  ///
  /// - Parameters:
  ///   - src: The URL of the image to display.
  ///   - alt: Alternative text for the image, used for accessibility.
  ///   - name: The name of the form control, as used in form submission.
  ///   - width: The width of the image in pixels.
  ///   - height: The height of the image in pixels.
  ///   - autoFocus: If true, indicates that the view should be focused as soon as
  ///   the page is loaded, allowing the user to interact with it without having to
  ///   manually focus the main view.
  public init(src: String, alt: String, name: String? = nil, width: Int? = nil, height: Int? = nil, autoFocus: Bool = false) {
    self.src = src
    self.alt = alt
    self.name = name
    self.width = width
    self.height = height
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "image")
    try element.attr("src", src)
    try element.attr("alt", alt)

    if let name {
      try element.attr("name", name)
    }
    if let width {
      try element.attr("width", String(width))
    }
    if let height {
      try element.attr("height", String(height))
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let src: String
  private let alt: String
  private let name: String?
  private let width: Int?
  private let height: Int?
  private let autoFocus: Bool
}
