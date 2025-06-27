import Foundation

import SwiftSoup

/// A picker represents a control for selecting amongst a set of options.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Picker {
///         Option("option1", value: "Option 1")
///         Option("option2", value: "Option 2")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [select](https://html.spec.whatwg.org/multipage/form-elements.html#the-select-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Picker<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "select"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a picker view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
