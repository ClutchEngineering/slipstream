import SwiftSoup

/// A view that represents a dialog box or other interactive component.
///
/// The Dialog element represents a part of an application that a user interacts with
/// to perform a task, such as a modal dialog, alert, or confirmation. By default,
/// dialogs are hidden unless the `open` attribute is set.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Dialog(open: true) {
///         Heading(level: 2) {
///           "Confirm Action"
///         }
///         Paragraph("Are you sure you want to proceed?")
///         Button("Confirm") {
///           DOMString("Confirm")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`dialog`](https://html.spec.whatwg.org/multipage/interactive-elements.html#the-dialog-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Dialog<Content>: View where Content: View {
  /// Creates a Dialog view.
  ///
  /// - Parameters:
  ///   - open: Whether the dialog is visible and active. Default is `false`.
  ///   - content: A view builder that creates the dialog's content.
  public init(open: Bool = false, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.open = open
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("dialog")

    if open {
      try element.attr("open", "")
    }

    try self.content().render(element, environment: environment)
  }

  private let open: Bool
  @ViewBuilder private let content: @Sendable () -> Content
}
