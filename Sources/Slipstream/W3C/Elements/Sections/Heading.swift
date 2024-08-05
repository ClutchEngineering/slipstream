import Foundation

import SwiftSoup

/// Errors that are thrown when the ``Heading`` view fails to render.
public enum HeadingError: Error, LocalizedError {
  /// The given level was not in the range 1 to 6, inclusive.
  case invalidLevel(Int)

  /// Returns a human-readable representation of this error.
  public var errorDescription: String? {
    switch self {
    case .invalidLevel(let level):
      return String("The level \(level) is not with the range 1 to 6, inclusive.")
    }
  }
}
/// A view that represents a heading for a section.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Heading(level: 1, "Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`h1-h6`](https://html.spec.whatwg.org/multipage/sections.html#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Heading<Content>: View where Content: View {
  /// The heading level. Must be a value between 1 and 6, inclusive.
  public let level: Int

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a heading view.
  ///
  /// - Parameters:
  ///   - level: Must be a value between 1 and 6, inclusive.
  ///   - content: The content to render within this header.
  public init(level: Int, @ViewBuilder content: @escaping () -> Content) {
    self.level = level
    self.content = content
  }

  /// Creates a heading view with some static text.
  ///
  /// - Parameters:
  ///   - level: Must be a value between 1 and 6, inclusive.
  ///   - text: The string to render within this header.
  public init(level: Int, _ text: String) where Content == Text {
    self.level = level
    self.content = {
      Text(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard level >= 1 && level <= 6 else {
      throw HeadingError.invalidLevel(level)
    }
    let element = try container.appendElement("h\(level)")
    try self.content().render(element, environment: environment)
  }
}
