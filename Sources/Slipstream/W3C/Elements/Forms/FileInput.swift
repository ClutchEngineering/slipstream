import SwiftSoup

/// A control that allows the user to select one or more files.
///
/// This represents an HTML file input element that provides a file picker
/// interface for uploading files to a server.
///
/// ```swift
/// // Basic file input
/// FileInput()
///
/// // File input for images only
/// FileInput(accept: "image/*")
///
/// // Multiple file selection
/// FileInput(name: "documents", multiple: true)
///
/// // File input with specific file types
/// FileInput(name: "avatar", accept: ".jpg,.png,.gif", id: "avatar-upload")
/// ```
///
/// - SeeAlso: W3C [input type="file"](https://html.spec.whatwg.org/multipage/input.html#file-upload-state-(type=file)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct FileInput: View {
  /// Creates a file input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission.
  ///   - accept: A comma-separated list of file types the input should accept.
  ///     Can be file extensions (e.g., ".jpg,.png") or MIME types (e.g., "image/*").
  ///   - multiple: If true, allows the user to select multiple files.
  ///   - id: The unique identifier for the file input, used for label association.
  ///   - required: If true, indicates that the user must select a file before
  ///     the owning form can be submitted.
  ///   - autoFocus: If true, indicates that the file input should be focused as soon as
  ///     the page is loaded, allowing the user to interact with it without having to
  ///     manually focus it first.
  public init(name: String? = nil, accept: String? = nil, multiple: Bool = false, id: String? = nil, required: Bool = false, autoFocus: Bool = false) {
    self.name = name
    self.accept = accept
    self.multiple = multiple
    self.id = id
    self.required = required
    self.autoFocus = autoFocus
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "file")

    if let name {
      try element.attr("name", name)
    }
    if let accept {
      try element.attr("accept", accept)
    }
    if multiple {
      try element.attr("multiple", "")
    }
    if let id {
      try element.attr("id", id)
    }
    if required {
      try element.attr("required", "")
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
  }

  private let name: String?
  private let accept: String?
  private let multiple: Bool
  private let id: String?
  private let required: Bool
  private let autoFocus: Bool
}
