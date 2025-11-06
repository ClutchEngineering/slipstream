/// A view that provides a list of predefined options for form controls.
///
/// The DataList element contains a set of Option elements that represent
/// predefined options for other form controls. This is typically used with
/// input elements to provide autocomplete suggestions by referencing the
/// datalist's id via the input's list attribute.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       DataList {
///         Option("Chrome")
///         Option("Firefox")
///         Option("Safari")
///         Option("Edge")
///       }
///       .id("browsers")
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`datalist`](https://html.spec.whatwg.org/multipage/form-elements.html#the-datalist-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct DataList<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "datalist"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a DataList view.
  ///
  /// - Parameter content: A ViewBuilder that creates the list of options.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
