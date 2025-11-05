/// Constants defining common MIME types for embedded content.
///
/// MIME types (Multipurpose Internet Mail Extensions types) are a standard
/// way to indicate the type of content being served. This enum provides
/// type-safe constants for common MIME types used with embedded content.
///
/// - SeeAlso: [IANA Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml)
///
/// ## See Also
///
/// - ``Embed``
@available(iOS 17.0, macOS 14.0, *)
public enum MimeType: String, Sendable {
  // MARK: - Video types

  /// MPEG-4 video format
  case videoMP4 = "video/mp4"

  /// WebM video format
  case videoWebM = "video/webm"

  /// Ogg video format
  case videoOgg = "video/ogg"

  /// QuickTime video format
  case videoQuickTime = "video/quicktime"

  // MARK: - Audio types

  /// MPEG audio format (MP3)
  case audioMPEG = "audio/mpeg"

  /// Ogg audio format
  case audioOgg = "audio/ogg"

  /// WAV audio format
  case audioWAV = "audio/wav"

  /// WebM audio format
  case audioWebM = "audio/webm"

  // MARK: - Application types

  /// PDF document
  case applicationPDF = "application/pdf"

  /// Adobe Flash (deprecated but still in use)
  case applicationFlash = "application/x-shockwave-flash"

  /// JSON data
  case applicationJSON = "application/json"

  /// XML data
  case applicationXML = "application/xml"

  // MARK: - Image types

  /// SVG vector image
  case imageSVG = "image/svg+xml"

  /// PNG image
  case imagePNG = "image/png"

  /// JPEG image
  case imageJPEG = "image/jpeg"

  /// GIF image
  case imageGIF = "image/gif"

  /// WebP image
  case imageWebP = "image/webp"

  // MARK: - Text types

  /// Plain text
  case textPlain = "text/plain"

  /// HTML document
  case textHTML = "text/html"

  /// CSS stylesheet
  case textCSS = "text/css"
}
