import Foundation

import SwiftSoup

/// The HTML `<template>` element.
///
/// A mechanism for holding HTML that is not to be rendered immediately when a page is
/// loaded but may be instantiated subsequently during runtime using JavaScript. The
/// content of a template element is parsed but not rendered, meaning images won't load,
/// scripts won't execute, and media won't play until the template is activated.
///
/// ```swift
/// struct MyDynamicContent: View {
///   var body: some View {
///     Body {
///       Template {
///         Div {
///           H2 { DOMString("Dynamic Content") }
///           Paragraph {
///             DOMString("This content will be cloned and inserted by JavaScript.")
///           }
///         }
///       }
///
///       Script("""
///         const template = document.querySelector('template');
///         const clone = template.content.cloneNode(true);
///         document.body.appendChild(clone);
///       """)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [template](https://html.spec.whatwg.org/multipage/scripting.html#the-template-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Template<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "template"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a template element.
  ///
  /// - Parameter content: The HTML content to be held in the template. This content
  ///   is parsed but not rendered until it's instantiated via JavaScript.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
