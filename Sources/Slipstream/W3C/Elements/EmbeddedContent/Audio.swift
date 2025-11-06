import Foundation

import SwiftSoup

/// A view that embeds an audio player.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Audio(URL(string: "/audio.mp3"), controls: true)
///     }
///   }
/// }
/// ```
///
/// You can also use the Audio view with multiple source elements for different audio formats:
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Audio(controls: true) {
///         // Source elements for different formats
///       }
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`audio`](https://html.spec.whatwg.org/multipage/media.html#the-audio-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Audio<Content>: View where Content: View {
  /// Creates an Audio view with a single source URL.
  ///
  /// - Parameters:
  ///   - url: The audio will be loaded from this URL.
  ///   - controls: Whether to display audio controls. Defaults to false.
  ///   - autoplay: Whether the audio should start playing automatically. Defaults to false.
  ///   - muted: Whether the audio should be muted by default. Defaults to false.
  ///   - loop: Whether the audio should loop playback. Defaults to false.
  public init(
    _ url: URL?,
    controls: Bool = false,
    autoplay: Bool = false,
    muted: Bool = false,
    loop: Bool = false
  ) where Content == Never {
    self.url = url
    self.content = nil
    self.controls = controls
    self.autoplay = autoplay
    self.muted = muted
    self.loop = loop
  }

  /// Creates an Audio view with custom content (e.g., multiple Source elements).
  ///
  /// - Parameters:
  ///   - controls: Whether to display audio controls. Defaults to false.
  ///   - autoplay: Whether the audio should start playing automatically. Defaults to false.
  ///   - muted: Whether the audio should be muted by default. Defaults to false.
  ///   - loop: Whether the audio should loop playback. Defaults to false.
  ///   - content: A ViewBuilder closure that provides the audio's content.
  public init(
    controls: Bool = false,
    autoplay: Bool = false,
    muted: Bool = false,
    loop: Bool = false,
    @ViewBuilder content: @escaping @Sendable () -> Content
  ) {
    self.url = nil
    self.content = content
    self.controls = controls
    self.autoplay = autoplay
    self.muted = muted
    self.loop = loop
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("audio")

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
}
