/// A view that represents a disclosure widget from which the user can obtain additional information.
///
/// The Details element creates a disclosure widget in which information is visible only
/// when the widget is toggled into an "open" state. A Summary element should be provided
/// as the first child to serve as the summary or legend.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Details {
///         Summary("Click to expand")
///         Paragraph("This is the expanded content that will be shown when opened.")
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`details`](https://html.spec.whatwg.org/multipage/interactive-elements.html#the-details-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Details<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "details"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a Details view.
  ///
  /// - Parameter content: A view builder that creates the details' content.
  ///   The first child should typically be a Summary element.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
