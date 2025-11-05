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
///         Link("New File") {
///           Text("New")
///         }
///       }
///       ListItem {
///         Link("Open File") {
///           Text("Open")
///         }
///       }
///       ListItem {
///         Link("Save File") {
///           Text("Save")
///         }
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
