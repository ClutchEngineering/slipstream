/// The HTML `<menu>` element.
///
/// Represents a group of commands or options that a user can perform or activate.
/// The menu element can be used for toolbars, context menus, or lists of form controls.
///
/// ```swift
/// struct ToolbarMenu: View {
///   var body: some View {
///     Menu {
///       ListItem {
///         Link("New", destination: URL(string: "/new"))
///       }
///       ListItem {
///         Link("Open", destination: URL(string: "/open"))
///       }
///       ListItem {
///         Link("Save", destination: URL(string: "/save"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [menu](https://html.spec.whatwg.org/multipage/grouping-content.html#the-menu-element) specification.
public struct Menu<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "menu"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a menu element.
  ///
  /// - Parameter content: The content to display in the menu, typically ``ListItem`` elements containing commands or options.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }
}
