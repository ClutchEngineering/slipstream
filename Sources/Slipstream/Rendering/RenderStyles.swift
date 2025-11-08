import Foundation

/// Renders styles by combining base CSS with component-specific styles.
///
/// This function reads a base CSS file and appends CSS from all component instances
/// conforming to `HasComponentCSS`, then writes the combined result to an output file.
/// Component styles are automatically deduplicated by CSS content and wrapped in `@layer components`
/// to ensure proper Tailwind CSS cascade order (base → components → utilities).
///
/// Components with identical CSS content are automatically deduplicated (first occurrence wins).
/// This is useful when the same component (e.g., a site header) is used across multiple pages.
///
/// - Parameter components: Array of component instances that conform to `HasComponentCSS`.
/// - Parameter baseCSS: URL to the base CSS file to read.
/// - Parameter output: URL where the combined CSS should be written.
/// - Parameter useComponentLayer: Whether to wrap component styles in `@layer components` for Tailwind CSS v3
///   cascade ordering. Defaults to `true`. Set to `false` for Tailwind CSS v4's automatic ordering.
/// - Throws: `CocoaError` if the base CSS file cannot be read, or if the output file or directory cannot be created or written.
@available(iOS 17.0, macOS 14.0, *)
public func renderStyles(
    from components: [any HasComponentCSS],
    baseCSS: URL,
    to output: URL,
    useComponentLayer: Bool = true
) throws {
    var cssContent = ""
    
    // Read base CSS file
    let baseContent = try String(contentsOf: baseCSS, encoding: .utf8)
    cssContent += baseContent
    cssContent += "\n\n"
    
    // Deduplicate components by CSS content (first occurrence wins)
    var seenCSS = Set<String>()
    let uniqueComponents = components.filter { component in
        seenCSS.insert(component.componentCSS).inserted
    }
    
    // Add component-specific styles
    if useComponentLayer {
        cssContent += "@layer components {\n"
    }
    
    for component in uniqueComponents {
        let indent = useComponentLayer ? "  " : ""
        cssContent += "\(indent)/* \(component.componentName) */\n"
        
        // Conditionally indent each line of component CSS
        if useComponentLayer {
            let indentedCSS = component.componentCSS
                .split(separator: "\n", omittingEmptySubsequences: false)
                .map { $0.isEmpty ? "" : "  \($0)" }
                .joined(separator: "\n")
            cssContent += indentedCSS
        } else {
            cssContent += component.componentCSS
        }
        cssContent += "\n\n"
    }
    
    if useComponentLayer {
        cssContent += "}\n"
    }
    
    // Ensure output directory exists
    let outputDir = output.deletingLastPathComponent()
    try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)
    
    // Write combined CSS to output file
    try cssContent.write(to: output, atomically: true, encoding: .utf8)
}
