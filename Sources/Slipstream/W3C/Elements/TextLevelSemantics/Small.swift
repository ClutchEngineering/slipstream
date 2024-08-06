/// A view that represents side comments such as small print.
///
/// Small print typically features disclaimers, caveats, legal
/// restrictions, or copyrights. Small print is also sometimes
/// used for attribution, or for satisfying licensing
/// requirements.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Small("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`small`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-small-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Small<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "small"

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a view within which text will be treated as small print.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a view with static text that will be treated as small print.
  public init(_ text: String) where Content == Text {
    self.content = {
      Text(text)
    }
  }
}
