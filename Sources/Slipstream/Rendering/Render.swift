import SwiftSoup
import Foundation

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
    // Pattern captures: indentation before content, content, indentation before closing tag
    // We'll strip the indentation (based on closing tag) while preserving content spaces
    let pattern = "<\(tag)>\\r?\\n([ \\t]*)(.*?)\\r?\\n([ \\t]*)</\(tag)>"
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    var nsString = html as NSString
    let matches = regex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))

    // Process matches in reverse to maintain string indices
    for match in matches.reversed() {
      guard match.numberOfRanges == 4 else { continue }
      let fullRange = match.range(at: 0)
      let leadingSpacesRange = match.range(at: 1)
      let contentRange = match.range(at: 2)
      let closingSpacesRange = match.range(at: 3)

      let leadingSpaces = nsString.substring(with: leadingSpacesRange)
      let content = nsString.substring(with: contentRange)
      let closingSpaces = nsString.substring(with: closingSpacesRange)

      // The closing tag's indentation tells us how much to strip from content line
      let indentCount = closingSpaces.count
      // Combine leading spaces and content, then strip only the indentation
      let fullContent = leadingSpaces + content
      let trimmedContent = String(fullContent.dropFirst(min(indentCount, fullContent.count)))

      let replacement = "<\(tag)>\(trimmedContent)</\(tag)>"
      html = nsString.replacingCharacters(in: fullRange, with: replacement) as String
      nsString = html as NSString
    }
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
      let pattern = "<\(tag)>\\r?\\n([ \\t]*)(.*?)\\r?\\n([ \\t]*)</\(tag)>"
      let regex = try! NSRegularExpression(pattern: pattern, options: [])
      var nsString = html as NSString
      let matches = regex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))

      for match in matches.reversed() {
        guard match.numberOfRanges == 4 else { continue }
        let fullRange = match.range(at: 0)
        let leadingSpacesRange = match.range(at: 1)
        let contentRange = match.range(at: 2)
        let closingSpacesRange = match.range(at: 3)

        let leadingSpaces = nsString.substring(with: leadingSpacesRange)
        let content = nsString.substring(with: contentRange)
        let closingSpaces = nsString.substring(with: closingSpacesRange)

        let indentCount = closingSpaces.count
        let fullContent = leadingSpaces + content
        let trimmedContent = String(fullContent.dropFirst(min(indentCount, fullContent.count)))

        let replacement = "<\(tag)>\(trimmedContent)</\(tag)>"
        html = nsString.replacingCharacters(in: fullRange, with: replacement) as String
        nsString = html as NSString
      }
    }

    return html
  } catch let error {
    return "<!-- \(error) -->"
  }
}
