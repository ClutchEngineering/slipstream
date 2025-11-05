import SwiftSoup

/// A view that groups related form controls together.
///
/// The fieldset element represents a set of form controls (or other content)
/// grouped together, optionally with a caption. The caption is given by the
/// first legend element child of the fieldset element, if any.
///
/// ```swift
/// Form {
///   Fieldset {
///     Legend("Shipping Address")
///     TextField("Street", type: .text)
///     TextField("City", type: .text)
///     TextField("Zip", type: .text)
///   }
///   Fieldset {
///     Legend("Payment Method")
///     RadioButton(name: "payment", value: "credit")
///     RadioButton(name: "payment", value: "debit")
///   }
/// }
/// ```
///
/// The `disabled` modifier can be used to disable all form controls within
/// the fieldset:
///
/// ```swift
/// Fieldset {
///   Legend("Disabled Section")
///   TextField("Name", type: .text)
/// }
/// .disabled()
///
/// - SeeAlso: W3C [`fieldset`](https://html.spec.whatwg.org/multipage/form-elements.html#the-fieldset-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Fieldset<Content>: View where Content: View {
  /// Creates a fieldset with content.
  ///
  /// - Parameters:
  ///   - name: The name of the fieldset for form submission purposes.
  ///   - content: A view builder that creates the fieldset's content.
  public init(name: String? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.name = name
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("fieldset")

    if let name {
      try element.attr("name", name)
    }

    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let name: String?
}
