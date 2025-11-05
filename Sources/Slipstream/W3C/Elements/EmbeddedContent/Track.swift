import Foundation

import SwiftSoup

/// The kind of text track.
@available(iOS 17.0, macOS 14.0, *)
public enum TrackKind: String, Sendable {
  /// Subtitles provide translation of content that cannot be understood by the viewer.
  case subtitles

  /// Captions provide a transcription and possibly a translation of audio.
  case captions

  /// Chapter titles are intended to be used when the user is navigating the media resource.
  case chapters

  /// Descriptions provide a textual description of the video content.
  case descriptions

  /// Metadata tracks contain information that scripts can use.
  case metadata
}

/// A view that specifies timed text tracks for media elements.
///
/// The Track element is used as a child of ``Video`` or audio elements to specify
/// timed text tracks such as subtitles, captions, descriptions, chapters, or metadata.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Video(controls: true) {
///         Source(URL(string: "/video.mp4"), colorScheme: .light)
///         Track(
///           URL(string: "/subtitles_en.vtt"),
///           kind: .subtitles,
///           srclang: "en",
///           label: "English",
///           default: true
///         )
///         Track(
///           URL(string: "/subtitles_es.vtt"),
///           kind: .subtitles,
///           srclang: "es",
///           label: "Spanish"
///         )
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`track`](https://html.spec.whatwg.org/multipage/media.html#the-track-element) specification.
///
/// ## See Also
///
/// - ``TrackKind``
/// - ``Video``
@available(iOS 17.0, macOS 14.0, *)
public struct Track: View {
  /// Creates a Track view.
  ///
  /// - Parameters:
  ///   - url: The URL of the text track data (typically a WebVTT file).
  ///   - kind: The kind of text track. Defaults to `.subtitles`.
  ///   - srclang: The language of the text track data as a valid BCP 47 language tag.
  ///     Required when kind is `.subtitles`.
  ///   - label: A user-readable title for the track.
  ///   - default: Whether this track should be enabled by default. Only one track
  ///     element with the same parent should have this set to true.
  public init(
    _ url: URL?,
    kind: TrackKind = .subtitles,
    srclang: String? = nil,
    label: String? = nil,
    default: Bool = false
  ) {
    self.url = url
    self.kind = kind
    self.srclang = srclang
    self.label = label
    self.default = `default`
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    guard let url else {
      return
    }
    let element = try container.appendElement("track")
    try element.attr("src", url.absoluteString)
    try element.attr("kind", kind.rawValue)

    if let srclang {
      try element.attr("srclang", srclang)
    }

    if let label {
      try element.attr("label", label)
    }

    if `default` {
      try element.attr("default", "")
    }
  }

  private let url: URL?
  private let kind: TrackKind
  private let srclang: String?
  private let label: String?
  private let `default`: Bool
}
