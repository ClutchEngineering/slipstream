import Foundation
import Testing

import Slipstream

final class RenderSitemapTests {

  let rootURL: URL

  init() throws {
    self.rootURL = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString)

    try FileManager.default.createDirectory(at: rootURL, withIntermediateDirectories: true)
  }

  deinit {
    try? FileManager.default.removeItem(at: rootURL)
  }

  @Test func mutation() async throws {
    var sitemap = Sitemap()
    sitemap["index.html"] = Text("Hello world")
    sitemap["about.html"] = Text("About").bold()
    try renderSitemap(sitemap, to: rootURL)

    let index = try #require(try String(contentsOf: rootURL.appending(path: "index.html"), encoding: .utf8))
    #expect(index == """
<!DOCTYPE html>
<p>Hello world</p>
""")

    let about = try #require(try String(contentsOf: rootURL.appending(path: "about.html"), encoding: .utf8))
    #expect(about == """
<!DOCTYPE html>
<p class="font-bold">About</p>
""")
  }

  @Test func parallelRendering() async throws {
    let rendered = try await renderSitemap([
      "index.html": Text("Hello world"),
      "about.html": Text("About").bold(),
    ])

    let index = try #require(rendered["index.html"])
    #expect(index == """
<!DOCTYPE html>
<p>Hello world</p>
""")

    let about = try #require(rendered["about.html"])
    #expect(about == """
<!DOCTYPE html>
<p class="font-bold">About</p>
""")
  }
}
