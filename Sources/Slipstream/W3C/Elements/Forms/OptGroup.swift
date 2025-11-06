import Foundation

import SwiftSoup

/// A group of options within a ``Picker``.
///
/// The `OptGroup` element represents a grouping of ``Option`` elements with a common label,
/// making it easier for users to navigate large lists of options in a select element.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Picker {
///         OptGroup("Fruits") {
///           Option("Apple", value: "apple")
///           Option("Banana", value: "banana")
///           Option("Orange", value: "orange")
///         }
///         OptGroup("Vegetables") {
///           Option("Carrot", value: "carrot")
///           Option("Lettuce", value: "lettuce")
///         }
///         .disabled()
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [optgroup](https://html.spec.whatwg.org/multipage/form-elements.html#the-optgroup-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct OptGroup<Content>: View where Content: View {
  /// Creates an option group with a label.
  ///
  /// - Parameters:
  ///   - label: The label for the option group.
  ///   - content: The options to include in the group.
  public init(_ label: String, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.label = label
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("optgroup")
    try element.attr("label", label)
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let label: String
}
