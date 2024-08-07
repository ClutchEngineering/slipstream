import Testing

import Slipstream
import Sitemap

struct SitemapTests {

  @Test func initialization() async throws {
    let sitemap = [
      "index.html": Text("Hello world")
    ]
    #expect(sitemap["index.html"] != nil)
  }

  @Test func mutation() async throws {
    var sitemap = Sitemap()
    sitemap["index.html"] = Text("Hello world")
    #expect(sitemap["index.html"] != nil)
  }
}
