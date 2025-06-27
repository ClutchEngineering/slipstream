/// Constants defining how a view handles cross-origin requests.
///
/// - SeeAlso: W3C [crossorigin](https://html.spec.whatwg.org/#cors-settings-attributes) guidance.
///
/// ## See Also
///
/// - ``Image``
/// - ``Script``
/// - ``Stylesheet``
@available(iOS 17.0, macOS 14.0, *)
public enum CrossOrigin: String, Sendable {
  /// Request uses CORS headers and credentials flag is set to 'same-origin'.
  ///
  /// There is no exchange of user credentials via cookies, client-side TLS
  /// certificates or HTTP authentication, unless destination is the same
  /// origin.
  case anonymous = ""

  /// Request uses CORS headers and credentials flag is set to 'include'.
  ///
  /// User credentials are always included.
  case useCredentials = "use-credentials"
}
