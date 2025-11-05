/// A view that represents a caption for a fieldset.
///
/// The legend element represents a caption for the content of its parent fieldset element.
///
/// ```swift
/// Fieldset {
///   Legend("Personal Information")
///   TextField("Name", type: .text)
///   TextField("Email", type: .email)
/// }
/// ```
///
/// - SeeAlso: W3C [`legend`](https://html.spec.whatwg.org/multipage/form-elements.html#the-legend-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Legend<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "legend"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a legend with custom content.
  ///
  /// - Parameter content: A view builder that creates the legend's content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a legend with static text.
  ///
  /// - Parameter text: The text content of the legend.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
