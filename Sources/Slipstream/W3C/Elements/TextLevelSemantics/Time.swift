import Foundation

import SwiftSoup

/// A view that represents a specific period in time or a range of time.
///
/// The Time element is used to represent dates, times, or durations in a
/// machine-readable format. This helps browsers, search engines, and assistive
/// technologies understand and process temporal information correctly.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("The concert starts at ")
///         Time("7:00 PM", datetime: "19:00")
///         DOMString(".")
///       }
///     }
///   }
/// }
/// ```
///
/// The datetime attribute accepts various formats:
/// - Date: "2024-12-25"
/// - Time: "14:30"
/// - DateTime: "2024-12-25T14:30:00Z"
/// - Duration: "PT2H30M" (2 hours and 30 minutes)
///
/// - SeeAlso: W3C [`time`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-time-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Time<Content>: View where Content: View {
  /// Creates a Time view with optional machine-readable datetime.
  ///
  /// - Parameters:
  ///   - datetime: An optional machine-readable date/time string. When provided,
  ///     it should follow W3C datetime formats (e.g., "2024-12-25", "19:00",
  ///     "2024-12-25T19:00:00Z").
  ///   - content: A ViewBuilder that creates the human-readable content.
  public init(datetime: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.datetime = datetime
    self.content = content
  }

  /// Creates a Time view with static text and optional machine-readable datetime.
  ///
  /// - Parameters:
  ///   - text: The human-readable text content to display.
  ///   - datetime: An optional machine-readable date/time string. When provided,
  ///     it should follow W3C datetime formats (e.g., "2024-12-25", "19:00",
  ///     "2024-12-25T19:00:00Z").
  public init(_ text: String, datetime: String? = nil) where Content == DOMString {
    self.datetime = datetime
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("time")

    if let datetime {
      try element.attr("datetime", datetime)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let datetime: String?
}
