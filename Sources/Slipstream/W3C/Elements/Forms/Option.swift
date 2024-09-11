import Foundation

import SwiftSoup

/// An option in a ``Picker``.
///
/// - SeeAlso: W3C [option](https://html.spec.whatwg.org/multipage/form-elements.html#the-option-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Option: View {
  /// Creates an option with an optional value.
  public init(_ label: String, value: String? = nil) {
    self.label = label
    self.value = value
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("option")
    if let value {
      try element.attr("value", value)
    }
    try element.text(label)
  }

  private let label: String
  private let value: String?
}
