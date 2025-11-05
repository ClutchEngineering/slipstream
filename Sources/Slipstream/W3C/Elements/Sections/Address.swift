/// A view that represents contact information for a document or section.
///
/// The Address element provides contact information for its nearest article or body
/// ancestor. It can include physical addresses, URLs, email addresses, phone numbers,
/// social media handles, and similar contact information.
///
/// **Important**: The address element should only be used for contact information
/// related to the document or section's author/owner, not for arbitrary addresses.
///
/// ```swift
/// struct MySiteFooter: View {
///   var body: some View {
///     Footer {
///       Address {
///         Text("Contact us at ")
///         Link("info@example.com", destination: URL(string: "mailto:info@example.com"))
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`address`](https://html.spec.whatwg.org/multipage/sections.html#the-address-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Address<Content>: W3CElement where Content: View {
  @_documentation(visibility: private)
  public let tagName: String = "address"

  @_documentation(visibility: private)
  @ViewBuilder public let content: @Sendable () -> Content

  /// Creates an address view.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.content = content
  }

  /// Creates an address view with static text.
  public init(_ text: String) where Content == DOMString {
    self.content = {
      DOMString(text)
    }
  }
}
