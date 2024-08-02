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
  return try document.html()
}
