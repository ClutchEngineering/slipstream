import SwiftSoup

/// A view that represents a string literal in an HTML document.
///
/// DOMString is a string literal, meaning the contents of the string will be rendered
/// as-is in the HTML document. Any HTML markup include in the string will be
/// escaped and represented as-is.
@available(iOS 17.0, macOS 14.0, *)
public struct DOMString: View {
  private let content: any StringProtocol

  /// Creates a text view that represents a string literal in an HTML document.
  ///
  /// Use this initializer to create a text view that displays the text in a string variable.
  ///
  /// ```swift
  /// // Display the contents of `someString` as-is.
  /// DOMString(someString)
  /// ```
  ///
  /// The provided string will be rendered as-is in your HTML document, meaning
  /// HTML-specific characters such as tags (`<p>`) will be escaped (`&lt;p&gt;`)
  /// in order to render as-is in the browser.
  ///
  /// - Parameter content: The string value to display without localization.
  public init<S>(_ content: S) where S: StringProtocol {
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    try container.appendText(String(content))
  }
}
