/// Constants defining the referrer policy for a view.
///
/// The referrer policy controls how much referrer information should be included
/// with requests made from the view.
///
/// - SeeAlso: W3C [referrerpolicy](https://www.w3.org/TR/referrer-policy/#referrer-policy) specification.
///
/// ## See Also
///
/// - ``Link``
/// - ``Image``
/// - ``Script``
@available(iOS 17.0, macOS 14.0, *)
public enum ReferrerPolicy: String, Sendable {
  /// The default referrer policy (empty string).
  ///
  /// The browser will use its default referrer policy.
  case `default` = ""

  /// Never send the referrer header.
  case noReferrer = "no-referrer"

  /// Send the full URL when performing a same-origin request, but only send the
  /// origin when the protocol security level stays the same (HTTPS→HTTPS).
  ///
  /// Don't send the Referer header to less secure destinations (HTTPS→HTTP).
  case noReferrerWhenDowngrade = "no-referrer-when-downgrade"

  /// Send only the origin, not the full URL.
  ///
  /// For example, a document at https://example.com/page.html will send the
  /// referrer https://example.com/.
  case origin = "origin"

  /// Send the full URL when performing a same-origin request, but only send
  /// the origin for cross-origin requests.
  case originWhenCrossOrigin = "origin-when-cross-origin"

  /// Send only the origin when performing a same-origin request.
  case sameOrigin = "same-origin"

  /// Send only the origin when the protocol security level stays the same (HTTPS→HTTPS).
  ///
  /// Don't send the Referer header to less secure destinations (HTTPS→HTTP).
  case strictOrigin = "strict-origin"

  /// Send the full URL when performing a same-origin request, send only the origin
  /// when the protocol security level stays the same (HTTPS→HTTPS), and send no
  /// header to less secure destinations (HTTPS→HTTP).
  case strictOriginWhenCrossOrigin = "strict-origin-when-cross-origin"

  /// Always send the full URL (regardless of the protocol security level).
  ///
  /// This policy will leak potentially-private information from HTTPS resource
  /// URLs to insecure origins. Carefully consider the impact of this setting.
  case unsafeURL = "unsafe-url"
}
