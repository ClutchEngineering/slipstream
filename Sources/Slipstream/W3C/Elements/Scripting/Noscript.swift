/// A view that represents a `<noscript>` element.
///
/// The `noscript` element provides fallback content for users who have disabled
/// JavaScript or are using browsers that don't support scripting.
///
/// ```swift
/// struct MySiteView: View {
///   var body: some View {
///     Body {
///       Script {
///         "console.log('JavaScript is enabled');"
///       }
///       Noscript {
///         Paragraph {
///           "Please enable JavaScript to use this site."
///         }
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C `noscript` specification: https://html.spec.whatwg.org/multipage/scripting.html#the-noscript-element
@available(iOS 17.0, macOS 14.0, *)
public struct Noscript<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "noscript"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates a noscript element.
  ///
  /// - Parameter content: The HTML content to display when JavaScript is disabled
  ///   or unavailable. This content is rendered only in environments where scripting
  ///   is not supported or has been disabled by the user.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates a noscript element with static text.
  ///
  /// - Parameter text: The text to display when JavaScript is disabled.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
