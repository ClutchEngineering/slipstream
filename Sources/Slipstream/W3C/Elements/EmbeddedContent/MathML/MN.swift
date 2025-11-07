import SwiftSoup

/// A view that represents a MathML `<mn>` element for numbers.
///
/// The `<mn>` element is used to represent numeric literals in mathematical expressions.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MN("42")
///           MO("+")
///           MN("3.14")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mn](https://www.w3.org/TR/MathML3/chapter3.html#presm.mn) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MN<ChildContent: View>: W3CElement {
  public let tagName = "mn"

  @ViewBuilder public let content: @Sendable () -> ChildContent

  /// Creates an MN element with view content.
  ///
  /// - Parameter content: The view content for the number
  public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
    self.content = content
  }
}

@available(iOS 17.0, macOS 14.0, *)
extension MN where ChildContent == DOMString {
  /// Creates an MN element with text content.
  ///
  /// - Parameter text: The number text content
  public init(_ text: String) {
    self.content = {
      DOMString(text)
    }
  }
}
