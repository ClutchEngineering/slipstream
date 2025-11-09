import Foundation
import SwiftSoup

/// Renders the given sitemap to a folder.
///
/// - Parameter sitemap: A mapping of relative paths to Slipstream views.
/// - Parameter folder: The root folder of the sitemap.
/// - Parameter cssConfiguration: Optional tuple specifying base CSS file and output location for generated component CSS.
///   When provided, components conforming to `HasComponentCSS` are automatically collected during rendering and their
///   CSS is combined with the base CSS file. The result is written to the specified output location.
/// - Parameter encoding: The encoding to use when saving files to disk.
/// - Throws: A SwiftSoup `Exception.Error` may be thrown if a failure occurs while rendering the view.
public func renderSitemap(
    _ sitemap: Sitemap,
    to folder: URL,
    cssConfiguration: (baseCSS: URL, output: URL)? = nil,
    encoding: String.Encoding = .utf8
) throws {
    // Create CSS collection context if CSS generation requested
    var environment = EnvironmentValues()
    let cssContext: ComponentLayerContext?
    
    if cssConfiguration != nil {
        let context = ComponentLayerContext()
        environment.componentLayerContext = context
        cssContext = context
    } else {
        cssContext = nil
    }
    
    // Render HTML pages (collecting CSS if context present)
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
    
    // Generate CSS file if requested
    if let cssConfiguration = cssConfiguration,
       let cssContext = cssContext {
        try renderStyles(
            from: cssContext.allComponents,
            baseCSS: cssConfiguration.baseCSS,
            to: cssConfiguration.output
        )
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
