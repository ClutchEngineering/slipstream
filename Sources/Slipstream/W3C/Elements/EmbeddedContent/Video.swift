import Foundation

import SwiftSoup

/// A view that embeds a video player.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Video(URL(string: "/video.mp4"), controls: true)
///     }
///   }
/// }
/// ```
///
/// You can also use the Video view with multiple source elements for different video formats:
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Video(controls: true) {
///         // Source elements for different formats
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`video`](https://html.spec.whatwg.org/multipage/media.html#the-video-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Video<Content>: View where Content: View {
  /// Creates a Video view with a single source URL.
  ///
  /// - Parameters:
  ///   - url: The video will be loaded from this URL.
  ///   - controls: Whether to display video controls. Defaults to false.
  ///   - autoplay: Whether the video should start playing automatically. Defaults to false.
  ///   - muted: Whether the video should be muted by default. Defaults to false.
  ///   - loop: Whether the video should loop playback. Defaults to false.
  ///   - width: The width of the video player in pixels.
  ///   - height: The height of the video player in pixels.
  ///   - poster: The URL of a poster image to show before the video plays.
  public init(
    _ url: URL?,
    controls: Bool = false,
    autoplay: Bool = false,
    muted: Bool = false,
    loop: Bool = false,
    width: Int? = nil,
    height: Int? = nil,
    poster: URL? = nil
  ) where Content == Never {
    self.url = url
    self.content = nil
    self.controls = controls
    self.autoplay = autoplay
    self.muted = muted
    self.loop = loop
    self.width = width
    self.height = height
    self.poster = poster
  }

  /// Creates a Video view with custom content (e.g., multiple Source elements).
  ///
  /// - Parameters:
  ///   - controls: Whether to display video controls. Defaults to false.
  ///   - autoplay: Whether the video should start playing automatically. Defaults to false.
  ///   - muted: Whether the video should be muted by default. Defaults to false.
  ///   - loop: Whether the video should loop playback. Defaults to false.
  ///   - width: The width of the video player in pixels.
  ///   - height: The height of the video player in pixels.
  ///   - poster: The URL of a poster image to show before the video plays.
  ///   - content: A ViewBuilder closure that provides the video's content.
  public init(
    controls: Bool = false,
    autoplay: Bool = false,
    muted: Bool = false,
    loop: Bool = false,
    width: Int? = nil,
    height: Int? = nil,
    poster: URL? = nil,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.url = nil
    self.content = content
    self.controls = controls
    self.autoplay = autoplay
    self.muted = muted
    self.loop = loop
    self.width = width
    self.height = height
    self.poster = poster
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("video")

    if let url {
      try element.attr("src", url.absoluteString)
    }

    if controls {
      try element.attr("controls", "")
    }

    if autoplay {
      try element.attr("autoplay", "")
    }

    if muted {
      try element.attr("muted", "")
    }

    if loop {
      try element.attr("loop", "")
    }

    if let width {
      try element.attr("width", String(width))
    }

    if let height {
      try element.attr("height", String(height))
    }

    if let poster {
      try element.attr("poster", poster.absoluteString)
    }

    if let content {
      try content().render(element, environment: environment)
    }
  }

  private let url: URL?
  private let content: (@Sendable () -> Content)?
  private let controls: Bool
  private let autoplay: Bool
  private let muted: Bool
  private let loop: Bool
  private let width: Int?
  private let height: Int?
  private let poster: URL?
}
