import Foundation

import SwiftSoup

/// A view that embeds a video player.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Video(URL(string: "/video.mp4"))
///         .controls(true)
///         .autoplay(false)
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
///       Video {
///         // Source elements for different formats
///       }
///       .controls(true)
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
  public init(_ url: URL?) where Content == Never {
    self.url = url
    self.content = nil
    self.controls = false
    self.autoplay = false
    self.muted = false
    self.loop = false
    self.width = nil
    self.height = nil
    self.poster = nil
  }

  /// Creates a Video view with custom content (e.g., multiple Source elements).
  ///
  /// - Parameters:
  ///   - content: A ViewBuilder closure that provides the video's content.
  public init(@ViewBuilder content: @escaping @Sendable () -> Content) {
    self.url = nil
    self.content = content
    self.controls = false
    self.autoplay = false
    self.muted = false
    self.loop = false
    self.width = nil
    self.height = nil
    self.poster = nil
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

  private init(
    url: URL?,
    content: (@Sendable () -> Content)?,
    controls: Bool,
    autoplay: Bool,
    muted: Bool,
    loop: Bool,
    width: Int?,
    height: Int?,
    poster: URL?
  ) {
    self.url = url
    self.content = content
    self.controls = controls
    self.autoplay = autoplay
    self.muted = muted
    self.loop = loop
    self.width = width
    self.height = height
    self.poster = poster
  }

  /// Sets whether the video player should display controls.
  ///
  /// - Parameter enabled: Whether to show the video controls.
  /// - Returns: A modified Video view.
  public func controls(_ enabled: Bool = true) -> Self {
    Self(
      url: url,
      content: content,
      controls: enabled,
      autoplay: autoplay,
      muted: muted,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets whether the video should start playing automatically.
  ///
  /// - Parameter enabled: Whether to autoplay the video.
  /// - Returns: A modified Video view.
  public func autoplay(_ enabled: Bool = true) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: enabled,
      muted: muted,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets whether the video should be muted by default.
  ///
  /// - Parameter enabled: Whether to mute the video.
  /// - Returns: A modified Video view.
  public func muted(_ enabled: Bool = true) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: autoplay,
      muted: enabled,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets whether the video should loop playback.
  ///
  /// - Parameter enabled: Whether to loop the video.
  /// - Returns: A modified Video view.
  public func loop(_ enabled: Bool = true) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: autoplay,
      muted: muted,
      loop: enabled,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets the width of the video player.
  ///
  /// - Parameter width: The width in pixels.
  /// - Returns: A modified Video view.
  public func width(_ width: Int) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: autoplay,
      muted: muted,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets the height of the video player.
  ///
  /// - Parameter height: The height in pixels.
  /// - Returns: A modified Video view.
  public func height(_ height: Int) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: autoplay,
      muted: muted,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }

  /// Sets the poster image to be shown before the video plays.
  ///
  /// - Parameter poster: The URL of the poster image.
  /// - Returns: A modified Video view.
  public func poster(_ poster: URL?) -> Self {
    Self(
      url: url,
      content: content,
      controls: controls,
      autoplay: autoplay,
      muted: muted,
      loop: loop,
      width: width,
      height: height,
      poster: poster
    )
  }
}
