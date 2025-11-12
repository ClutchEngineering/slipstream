import Foundation
import SwiftSoup

/// Renders the given sitemap to a folder.
///
/// - Parameter sitemap: A mapping of relative paths to Slipstream views.
/// - Parameter folder: The root folder of the sitemap.
/// - Parameter encoding: The encoding to use when saving files to disk.
/// - Throws: A SwiftSoup `Exception.Error` may be thrown if a failure occurs while rendering the view.
public func renderSitemap(_ sitemap: Sitemap, to folder: URL, encoding: String.Encoding = .utf8) throws {
  for (path, view) in sitemap.sorted(by: { $0.key < $1.key }) {
    let output = try "<!DOCTYPE html>\n" + renderHTML(view)
    let fileURL = folder.appending(path: path)
    let folderURL = fileURL.deletingLastPathComponent()
    if !FileManager.default.fileExists(atPath: folderURL.path(percentEncoded: false)) {
      try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
    }
    try output.write(to: fileURL, atomically: true, encoding: encoding)
  }
}

/// Renders the given sitemap to a folder with CSS component collection.
///
/// This async variant automatically collects CSS from components conforming to `StyleModifier`
/// by traversing the view hierarchy. The collected CSS is combined with the base CSS file
/// and written to the specified stylesheet location within the site folder.
///
/// - Parameter sitemap: A mapping of relative paths to Slipstream views.
/// - Parameter folder: The root folder of the sitemap where HTML and CSS files are generated.
/// - Parameter baseCSS: URL to the base CSS file that will be combined with component styles.
/// - Parameter stylesheet: Path relative to `folder` where the generated CSS will be written. Defaults to "styles.css".
/// - Parameter encoding: The encoding to use when saving files to disk.
/// - Throws: A SwiftSoup `Exception.Error` may be thrown if a failure occurs while rendering the view.
public func renderSitemap(
    _ sitemap: Sitemap,
    to folder: URL,
    baseCSS: URL,
    stylesheet: String = "styles.css",
    encoding: String.Encoding = .utf8
) async throws {
    var environment = EnvironmentValues()
    let styleContext = StyleContext()
    environment.styleContext = styleContext

    // Traverse all views to collect CSS components
    // This must complete before CSS generation begins
    for (_, view) in sitemap {
        try await view.style(environment: environment)
    }
    
    let allComponents = await styleContext.allComponents
    
    // Generate CSS file to folder + stylesheet path
    let stylesheetURL = folder.appending(path: stylesheet)
    try renderStyles(
        from: allComponents,
        baseCSS: baseCSS,
        to: stylesheetURL
    )
    
    // Render HTML pages
    for (path, view) in sitemap.sorted(by: { $0.key < $1.key }) {
        let document = Document("/")
        try view.render(document, environment: environment)
        let output = try "<!DOCTYPE html>\n" + document.html()
        
        let fileURL = folder.appending(path: path)
        let folderURL = fileURL.deletingLastPathComponent()
        if !FileManager.default.fileExists(atPath: folderURL.path(percentEncoded: false)) {
            try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
        }
        try output.write(to: fileURL, atomically: true, encoding: encoding)
    }
}

/// Renders a sitemap in parallel and returns the rendered pages.
///
/// - Parameter sitemap: A mapping of relative paths to Slipstream views.
/// - Parameter folder: The root folder of the sitemap.
/// - Parameter encoding: The encoding to use when saving files to disk.
/// - Throws: A SwiftSoup `Exception.Error` may be thrown if a failure occurs while rendering the view.
public func renderSitemap(_ sitemap: Sitemap, encoding: String.Encoding = .utf8) async throws -> [Sitemap.Key: String] {
  return try await withThrowingTaskGroup(of: (Sitemap.Key, String).self) { group in
    // Add a task for each key-value pair
    for (path, view) in sitemap.sorted(by: { $0.key < $1.key }) {
      group.addTask {
        let renderedPage = try "<!DOCTYPE html>\n" + renderHTML(view)
        return (path, renderedPage)
      }
    }

    // Collect results back into a dictionary
    var resultDict: [Sitemap.Key: String] = [:]
    for try await (path, renderedPage) in group {
      resultDict[path] = renderedPage
    }

    return resultDict
  }
}
