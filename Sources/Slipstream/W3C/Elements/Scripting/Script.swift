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
  public init(_ url: URL?, executionMode: ScriptExecutionMode? = nil) {
    self.storage = .url(url, executionMode: executionMode)
  }

  /// Creates a script view with inline source.
  public init(_ source: String) {
    self.storage = .inline(source)
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    switch storage {
    case .url(let url, let executionMode):
      guard let url else {
        return
      }
      let element = try container.appendElement("script")
      try element.attr("src", url.absoluteString)
      if let executionMode {
        try element.attr(executionMode.rawValue, "")
      }
    case .inline(let string):
      let element = try container.appendElement("script")
      // DataNode is required to avoid escaping the script source.
      try element.appendChild(DataNode(string, container.getBaseUri()))
    }
  }

  private enum Storage {
    case url(URL?, executionMode: ScriptExecutionMode?)
    case inline(String)
  }

  private let storage: Storage
}
