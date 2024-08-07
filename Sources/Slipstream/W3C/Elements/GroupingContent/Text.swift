/// A view that is equivalent to a ``Paragraph`` and roughly mimics
/// the behavior of SwiftUI's equivalent type.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Text("Hello, world!")
///     }
///   }
/// }
/// ```
///
/// ## See Also
///
/// - ``Paragraph``
@available(iOS 17.0, macOS 14.0, *)
public struct Text<Content>: View where Content: View {

  @_documentation(visibility: private)
  @ViewBuilder public let content: () -> Content

  /// Creates a text view.
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  /// Creates a text view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }

  @_documentation(visibility: private)
  public var body: some View {
    Paragraph(content: content)
  }
}
