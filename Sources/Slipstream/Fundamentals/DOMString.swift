import SwiftSoup

/// A view that displays one or more lines of read-only text.
///
/// A text view adds a string to your HTML document.
@available(iOS 17.0, macOS 14.0, *)
public struct DOMString: View {
  private let content: any StringProtocol

  /// Creates a text view that displays a stored string without localization.
  ///
  /// Use this initializer to create a text view that displays — without
  /// localization — the text in a string variable.
  ///
  /// ```swift
  /// // Display the contents of `someString` without localization.
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
