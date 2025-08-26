import Foundation

/// Renders styles by combining base CSS with component-specific styles.
///
/// This function reads a base CSS file and appends CSS from all component instances
/// conforming to `HasComponentCSS`, then writes the combined result to an output file.
///
/// - Parameter components: Array of component instances that conform to `HasComponentCSS`.
/// - Parameter baseCSS: URL to the base CSS file to read.
/// - Parameter output: URL where the combined CSS should be written.
/// - Throws: `CocoaError` if the base CSS file cannot be read, or if the output file or directory cannot be created or written.
@available(iOS 17.0, macOS 14.0, *)
public func renderStyles(
    from components: [any HasComponentCSS],
    baseCSS: URL,
    to output: URL
) throws {
    var cssContent = ""
    
    // Read base CSS file
    let baseContent = try String(contentsOf: baseCSS, encoding: .utf8)
    cssContent += baseContent
    cssContent += "\n\n"
    
    // Add component-specific styles
    cssContent += "/* Component-specific styles */\n"
    
    for component in components {
        cssContent += "/* \(component.componentName) */\n"
        cssContent += component.componentCSS
        cssContent += "\n\n"
    }
    
    // Ensure output directory exists
    let outputDir = output.deletingLastPathComponent()
    try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)
    
    // Write combined CSS to output file
    try cssContent.write(to: output, atomically: true, encoding: .utf8)
}
