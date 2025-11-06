/// Represents sample or quoted output from a computer program.
///
/// Use this element to display output from programs, scripts, or systems.
///
/// ```swift
/// SampleOutput {
///   "Error: File not found"
/// }
/// ```
///
/// - SeeAlso: W3C [samp](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-samp-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct SampleOutput<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "samp"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a SampleOutput view.
  ///
  /// - Parameter content: The sample output content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a SampleOutput view with static text.
  ///
  /// - Parameter text: The sample output text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
