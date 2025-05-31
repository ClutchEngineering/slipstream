import Foundation

import SwiftSoup

/// Constants defining how ``Script`` views initialized with a url should
/// be executed.
///
/// - SeeAlso: W3C [`body`](https://html.spec.whatwg.org/multipage/scripting.html#attr-script-defer) specification.
@available(iOS 17.0, macOS 14.0, *)
public enum ScriptExecutionMode: String {
  /// The script will be fetched in parallel to document parsing and
  /// evaluated as soon as it is available (potentially before parsing
  /// completes).
  case async

  /// The script will be fetched in parallel and evaluated when the
  /// page has finished parsing.
  case `defer`
}

/// A view that represents a script.
///
/// ```swift
/// struct MySiteContent: View {
///   var body: some View {
///     Body {
///       Script(URL(string: "/js/main.js"), executionMode: .async)
///     }
///   }
/// }
/// ```
///
/// - SeeAlso: W3C [`script`](https://html.spec.whatwg.org/multipage/scripting.html#the-script-element) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Script: View {
  /// Creates a script view pointing to a URL.
  ///
  /// - Parameters:
  ///   - url: The script will be loaded from this URL.
  ///   - crossOrigin: If provided, configures the Cross-Origin Resource Sharing (CORS)
  ///   behavior for the request of this resource. If not provided, then the No CORS state is
  ///   implied.
  ///   - executionMode: The execution mode for this script defines how and when the
  ///   script should be loaded in relation to the rest of the document.
  public init(_ url: URL?, crossOrigin: CrossOrigin? = nil, executionMode: ScriptExecutionMode? = nil) {
    self.storage = .url(url, crossOrigin: crossOrigin, executionMode: executionMode)
  }

  /// Creates a script view with inline source.
  public init(_ source: String) {
    self.storage = .inline(source)
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    switch storage {
    case .url(let url, let crossOrigin, let executionMode):
      guard let url else {
        return
      }
      let element = try container.appendElement("script")
      try element.attr("src", url.absoluteString)
      if let crossOrigin {
        try element.attr("crossorigin", crossOrigin.rawValue)
      }
      if let executionMode {
        try element.attr(executionMode.rawValue, "")
      }
    case .inline(let string):
      let element = try container.appendElement("script")
      // DataNode is required to avoid escaping the script source.
      try element.appendChild(DataNode(string.utf8Array, container.getBaseUri().utf8Array))
    }
  }

  private enum Storage {
    case url(URL?, crossOrigin: CrossOrigin?, executionMode: ScriptExecutionMode?)
    case inline(String)
  }

  private let storage: Storage
}
