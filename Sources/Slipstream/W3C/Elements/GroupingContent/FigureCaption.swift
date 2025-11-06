/// A view that represents a caption or legend for a ``Figure``.
///
/// The `<figcaption>` element provides a caption or legend describing the content
/// of its parent ``Figure`` element. It can appear as either the first or the last
/// child of the ``Figure``.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Figure {
///         Image(URL(string: "/images/chart.png")!)
///         FigureCaption {
///           DOMString("Sales data for Q4 2024")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`figcaption`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-figcaption-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct FigureCaption<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "figcaption"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a FigureCaption view.
  ///
  /// - Parameter content: The caption content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a FigureCaption view with static text.
  ///
  /// - Parameter text: The caption text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
