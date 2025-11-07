/// A view that represents a variable in mathematical expressions or programming contexts.
///
/// The Variable element represents the name of a variable, parameter, or placeholder
/// in mathematical expressions or programming contexts.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Paragraph {
///         DOMString("The equation ")
///         Variable("x")
///         DOMString(" + ")
///         Variable("y")
///         DOMString(" = ")
///         Variable("z")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`var`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-var-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Variable<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "var"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Variable view with custom content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a Variable view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
