import Foundation

import SwiftSoup

/// Constants that control the form submission behavior.
///
/// - SeeAlso: W3C [form submission attributes](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#form-submission-attributes) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum FormSubmitMethod: String, Sendable {
  /// Indicates the form will use the HTTP GET method.
  case get

  /// Indicates the form will use the HTTP POST method.
  case post

  /// Indicates the form is intended to close the dialog box
  /// in which the form finds itself, if any, and otherwise
  /// not submit.
  case dialog
}

/// A form represents a hyperlink that can be manipulated through a collection
/// of form-associated views, some of which can represent editable values
/// that can be submitted to a server for processing.
///
/// A Div represents its children. Modifiers applied to a Div will
/// propagate to its children.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Form(method: .post, url: URL(string: "/login") {
///         TextField("Email", type: .email)
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [form](https://html.spec.whatwg.org/multipage/forms.html#the-form-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Form<Content>: View where Content: View {
  /// Creates a form with content.
  public init(method: FormSubmitMethod? = nil, url: URL? = nil, @ViewBuilder content: @escaping @Sendable () -> Content) {
    self.method = method
    self.url = url
    self.content = content
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("form")
    if let method {
      try element.attr("method", method.rawValue)
    }
    if let url {
      try element.attr("action", url.absoluteString)
    }
    try self.content().render(element, environment: environment)
  }

  @ViewBuilder private let content: @Sendable () -> Content
  private let method: FormSubmitMethod?
  private let url: URL?
}
