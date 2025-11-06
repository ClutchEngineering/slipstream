import SwiftSoup

/// A view that represents the result of a calculation or user action.
///
/// The Output element represents the result of a calculation performed by the application,
/// or the result of a user action. It's typically used in forms to display computed values.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Form {
///         Input(type: .number, id: "a", name: "a")
///         DOMString(" + ")
///         Input(type: .number, id: "b", name: "b")
///         DOMString(" = ")
///         Output(for: ["a", "b"], name: "result") {
///           DOMString("0")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`output`](https://html.spec.whatwg.org/multipage/form-elements.html#the-output-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Output<Content>: View where Content: View {
  /// Creates an Output view with optional for and name attributes.
  ///
  /// - Parameters:
  ///   - for: An array of element IDs that contributed to the output value.
  ///   - name: The name of the output element for form submission.
  ///   - content: A view builder that creates the output's content.
  public init(
    for elementIds: [String]? = nil,
    name: String? = nil,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.elementIds = elementIds
    self.name = name
    self.content = content
  }

  /// Creates an Output view with static text.
  ///
  /// - Parameters:
  ///   - text: The output text to display.
  ///   - for: An array of element IDs that contributed to the output value.
  ///   - name: The name of the output element for form submission.
  public init(
    _ text: String,
    for elementIds: [String]? = nil,
    name: String? = nil
  ) where Content == DOMString {
    self.elementIds = elementIds
    self.name = name
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("output")

    if let elementIds, !elementIds.isEmpty {
      try element.attr("for", elementIds.joined(separator: " "))
    }

    if let name {
      try element.attr("name", name)
    }

    try self.content().render(element, environment: environment)
  }

  private let elementIds: [String]?
  private let name: String?
  @ViewBuilder private let content: @Sendable () -> Content
}
