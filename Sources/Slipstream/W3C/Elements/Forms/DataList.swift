import Foundation

import SwiftSoup

/// A view that provides a list of predefined options for form controls.
///
/// The DataList element contains a set of Option elements that represent
/// predefined options for other form controls. This is typically used with
/// TextField (input) elements to provide autocomplete suggestions.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Form {
///         TextField(type: .text, name: "browser")
///           .attribute("list", "browsers")
///         DataList(id: "browsers") {
///           Option("Chrome")
///           Option("Firefox")
///           Option("Safari")
///           Option("Edge")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`datalist`](https://html.spec.whatwg.org/multipage/form-elements.html#the-datalist-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DataList<Content>: View where Content: View {
  /// Creates a DataList view with an optional ID.
  ///
  /// - Parameters:
  ///   - id: An optional identifier that can be referenced by form controls.
  ///   - content: A ViewBuilder that creates the list of options.
  public init(id: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.id = id
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("datalist")

    if let id {
      try element.attr("id", id)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let id: String?
}
