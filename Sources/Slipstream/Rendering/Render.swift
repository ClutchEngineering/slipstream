import SwiftSoup

/// Renders the given view as an HTML document and returns the HTML.
/// 
/// Can be used in a variety of ways, including passing one-off View instances like so:
/// 
/// ```swift
/// try renderHTML(Text("Hello, world!"))
/// ```
///
/// Slipstream uses [SwiftSoup](https://scinfu.github.io/SwiftSoup/) to render
/// HTML, and this rendering process may throw exceptions if the content is malformed in
/// some way. To explicitly catch SwiftSoup errors:
///
/// ```swift
/// do {
///   try renderHTML(Text("Hello, world!"))
/// } catch Exception.Error(let type, let message) {
///   print(message)
/// }
/// ```
///
/// - Parameter view: The root view of the HTML document to be rendered.
/// - Throws: A SwiftSoup `Exception.Error` may be thrown if a failure occurs while rendering the view.
/// - Returns: The generated and formatted HTML string.
public func renderHTML(_ view: any View) throws -> String {
  let document = Document("/")
  try view.render(document, environment: EnvironmentValues())
  var html = try document.html()

  // Post-process to format MathML token elements inline
  // SwiftSoup doesn't know MathML tags, so it formats them as block-level
  // We need to collapse whitespace within these elements to render them inline
  let mathmlTokenTags = ["mi", "mo", "mn", "ms", "mtext"]
  for tag in mathmlTokenTags {
    // Pattern matches: <tag>\n whitespace text whitespace\n</tag>
    // Replaces with: <tag>text</tag>
    let pattern = "<\(tag)>\\s*([^<]+?)\\s*</\(tag)>"
    html = html.replacingOccurrences(
      of: pattern,
      with: "<\(tag)>$1</\(tag)>",
      options: .regularExpression
    )
  }

  return html
}

/// Renders the given view as an HTML document and returns the HTML.
///
/// This is a non-throwing alternative to ``renderHTML(_:)`` that can be used more easily in
/// string concatenation, such as ``MarkdownText`` content.
///
/// Note that this method creates a new environment context.
///
/// - Parameter builder: A block that constructs the view or set of views to be rendered.
/// - Returns: The generated and formatted HTML string. If an error occurs during rendering, then the
/// error will be returned as an HTML comment.
public func inlineHTML<Content: View>(@ViewBuilder _ builder: () -> Content) -> String {
  let document = Document("/")
  do {
    try builder().render(document, environment: EnvironmentValues())
    var html = try document.html()

    // Post-process to format MathML token elements inline
    let mathmlTokenTags = ["mi", "mo", "mn", "ms", "mtext"]
    for tag in mathmlTokenTags {
      let pattern = "<\(tag)>\\s*([^<]+?)\\s*</\(tag)>"
      html = html.replacingOccurrences(
        of: pattern,
        with: "<\(tag)>$1</\(tag)>",
        options: .regularExpression
      )
    }

    return html
  } catch let error {
    return "<!-- \(error) -->"
  }
}
