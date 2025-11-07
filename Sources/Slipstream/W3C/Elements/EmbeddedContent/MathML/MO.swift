import SwiftSoup

/// A view that represents a MathML `<mo>` element for operators.
///
/// The `<mo>` element is used to represent operators in mathematical expressions,
/// such as +, -, ×, ÷, =, and other mathematical operators.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Math {
///         MRow {
///           MI("x")
///           MO("+")
///           MI("y")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [mo](https://www.w3.org/TR/MathML3/chapter3.html#presm.mo) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct MO<ChildContent: View>: W3CElement {
  public let tagName = "mo"

  @ViewBuilder public let content: @Sendable () -> ChildContent

  /// Creates an MO element with view content.
  ///
  /// - Parameter content: The view content for the operator
  public init(@ViewBuilder content: @escaping @Sendable () -> ChildContent) {
    self.content = content
  }
}

@available(iOS 17.0, macOS 14.0, *)
extension MO where ChildContent == DOMString {
  /// Creates an MO element with text content.
  ///
  /// - Parameter text: The operator text content
  public init(_ text: String) {
    self.content = {
      DOMString(text)
    }
  }
}
