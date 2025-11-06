/// A view that represents a description list containing term-description groups.
///
/// The `<dl>` element represents an association list consisting of zero or more
/// term-description groupings. Each grouping consists of one or more terms
/// (represented by `DescriptionTerm` elements) and one or more descriptions
/// (represented by `DefinitionDescription` elements).
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       DescriptionList {
///         DescriptionTerm("Swift")
///         DefinitionDescription {
///           DOMString("A powerful programming language by Apple")
///         }
///         DescriptionTerm("SwiftUI")
///         DefinitionDescription {
///           DOMString("A declarative UI framework")
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`dl`](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DescriptionList<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "dl"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a DescriptionList view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
