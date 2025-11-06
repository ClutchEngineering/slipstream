import Foundation
import SwiftSoup

/// Represents an addition to the document.
///
/// Use this element to mark text that has been inserted into a document,
/// typically as part of tracking changes or showing revisions.
///
/// ```swift
/// Ins {
///   "This text was added to the document"
/// }
/// ```
///
/// You can optionally provide a citation URL and datetime for the insertion:
///
/// ```swift
/// Ins(cite: URL(string: "https://example.com/changes"), datetime: Date()) {
///   "Added text with metadata"
/// }
/// ```
///
/// - SeeAlso: W3C [ins](https://html.spec.whatwg.org/multipage/edits.html#the-ins-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Ins<Content>: View where Content: View {
  /// Creates an Ins view.
  ///
  /// - Parameters:
  ///   - cite: A URL that explains the change.
  ///   - datetime: The date and time of the change.
  ///   - content: The inserted content.
  public init(cite: URL? = nil, datetime: Date? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.cite = cite
    self.datetime = datetime
    self.content = content
  }

  /// Creates an Ins view with static text.
  ///
  /// - Parameters:
  ///   - text: The inserted text.
  ///   - cite: A URL that explains the change.
  ///   - datetime: The date and time of the change.
  public init(_ text: String, cite: URL? = nil, datetime: Date? = nil) where Content == DOMString {
    self.cite = cite
    self.datetime = datetime
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("ins")

    if let cite {
      try element.attr("cite", cite.absoluteString)
    }

    if let datetime {
      let formatter = ISO8601DateFormatter()
      try element.attr("datetime", formatter.string(from: datetime))
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let cite: URL?
  private let datetime: Date?
}
