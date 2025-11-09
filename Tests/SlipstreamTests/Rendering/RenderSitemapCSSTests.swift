import Foundation
import Testing

@testable import Slipstream

final class RenderSitemapCSSTests {
    let rootURL: URL
    
    init() throws {
        self.rootURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)
        try FileManager.default.createDirectory(at: rootURL, withIntermediateDirectories: true)
    }
    
    deinit {
        try? FileManager.default.removeItem(at: rootURL)
    }
    
    @Test func rendersHTMLWithoutCSS() async throws {
        let sitemap: Sitemap = ["index.html": Text("Hello")]
        try renderSitemap(sitemap, to: rootURL)
        
        let html = try String(contentsOf: rootURL.appending(path: "index.html"), encoding: .utf8)
        #expect(html.contains("Hello"))
    }
    
    @Test func collectsAndGeneratesCSS() async throws {
        struct TestComponent: View, HasComponentCSS {
            var componentCSS: String { ".test { color: red; }" }
            var body: some View { Text("Test") }
        }
        
        let baseCSSURL = rootURL.appending(path: "base.css")
        let cssOutputURL = rootURL.appending(path: "output.css")
        
        try "/* Base */".write(to: baseCSSURL, atomically: true, encoding: .utf8)
        
        let sitemap: Sitemap = ["index.html": TestComponent()]
        try renderSitemap(
            sitemap,
            to: rootURL,
            cssConfiguration: (baseCSS: baseCSSURL, output: cssOutputURL)
        )
        
        let css = try String(contentsOf: cssOutputURL, encoding: .utf8)
        #expect(css.contains("/* Base */"))
        #expect(css.contains(".test { color: red; }"))
        #expect(css.contains("@layer components"))
    }
    
    @Test func deduplicatesSharedComponents() async throws {
        struct Header: View, HasComponentCSS {
            var componentCSS: String { ".header { padding: 10px; }" }
            var body: some View { Text("Header") }
        }
        
        let baseCSSURL = rootURL.appending(path: "base.css")
        let cssOutputURL = rootURL.appending(path: "output.css")
        try "".write(to: baseCSSURL, atomically: true, encoding: .utf8)
        
        let sitemap: Sitemap = [
            "page1.html": Header(),
            "page2.html": Header(),
            "page3.html": Header()
        ]
        
        try renderSitemap(
            sitemap,
            to: rootURL,
            cssConfiguration: (baseCSS: baseCSSURL, output: cssOutputURL)
        )
        
        let css = try String(contentsOf: cssOutputURL, encoding: .utf8)
        let occurrences = css.components(separatedBy: ".header { padding: 10px; }").count - 1
        #expect(occurrences == 1)  // Only appears once despite 3 pages
    }
    
    @Test func collectsFromNestedComponents() async throws {
        struct InnerComponent: View, HasComponentCSS {
            var componentCSS: String { ".inner { margin: 5px; }" }
            var body: some View { Text("Inner") }
        }
        
        struct OuterComponent: View, HasComponentCSS {
            var componentCSS: String { ".outer { padding: 10px; }" }
            var body: some View { InnerComponent() }
        }
        
        let baseCSSURL = rootURL.appending(path: "base.css")
        let cssOutputURL = rootURL.appending(path: "output.css")
        try "".write(to: baseCSSURL, atomically: true, encoding: .utf8)
        
        let sitemap: Sitemap = ["index.html": OuterComponent()]
        try renderSitemap(
            sitemap,
            to: rootURL,
            cssConfiguration: (baseCSS: baseCSSURL, output: cssOutputURL)
        )
        
        let css = try String(contentsOf: cssOutputURL, encoding: .utf8)
        #expect(css.contains(".outer { padding: 10px; }"))
        #expect(css.contains(".inner { margin: 5px; }"))
    }
    
    @Test func handlesMultiplePages() async throws {
        struct PageA: View, HasComponentCSS {
            var componentCSS: String { ".page-a { color: blue; }" }
            var body: some View { Text("Page A") }
        }
        
        struct PageB: View, HasComponentCSS {
            var componentCSS: String { ".page-b { color: green; }" }
            var body: some View { Text("Page B") }
        }
        
        let baseCSSURL = rootURL.appending(path: "base.css")
        let cssOutputURL = rootURL.appending(path: "output.css")
        try "".write(to: baseCSSURL, atomically: true, encoding: .utf8)
        
        let sitemap: Sitemap = [
            "a.html": PageA(),
            "b.html": PageB()
        ]
        
        try renderSitemap(
            sitemap,
            to: rootURL,
            cssConfiguration: (baseCSS: baseCSSURL, output: cssOutputURL)
        )
        
        let css = try String(contentsOf: cssOutputURL, encoding: .utf8)
        #expect(css.contains(".page-a { color: blue; }"))
        #expect(css.contains(".page-b { color: green; }"))
    }
    
    @Test func doesNotCollectCSSWithoutConfiguration() async throws {
        struct TestComponent: View, HasComponentCSS {
            var componentCSS: String { ".test { color: red; }" }
            var body: some View { Text("Test") }
        }
        
        let sitemap: Sitemap = ["index.html": TestComponent()]
        try renderSitemap(sitemap, to: rootURL)
        
        // HTML should be rendered
        let html = try String(contentsOf: rootURL.appending(path: "index.html"), encoding: .utf8)
        #expect(html.contains("Test"))
        
        // CSS file should not exist
        let cssURL = rootURL.appending(path: "output.css")
        #expect(!FileManager.default.fileExists(atPath: cssURL.path(percentEncoded: false)))
    }
}
