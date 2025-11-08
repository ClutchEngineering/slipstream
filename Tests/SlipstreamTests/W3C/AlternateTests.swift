import Foundation
import Testing
import Slipstream

struct AlternateTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Alternate(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Alternate(URL(string: "/feed.xml"))) == #"<link rel="alternate" href="/feed.xml" />"#)
  }

  @Test func withType() throws {
    try #expect(renderHTML(Alternate(URL(string: "/feed.xml"), type: "application/rss+xml")) == #"<link rel="alternate" href="/feed.xml" type="application/rss+xml" />"#)
  }

  @Test func withLanguage() throws {
    try #expect(renderHTML(Alternate(URL(string: "/es/"), language: "es")) == #"<link rel="alternate" href="/es/" hreflang="es" />"#)
  }

  @Test func withTitle() throws {
    try #expect(renderHTML(Alternate(URL(string: "/feed.xml"), title: "RSS Feed")) == #"<link rel="alternate" href="/feed.xml" title="RSS Feed" />"#)
  }

  @Test func withAllAttributes() throws {
    try #expect(renderHTML(Alternate(URL(string: "/es/feed.xml"), type: "application/rss+xml", language: "es", title: "Spanish RSS Feed")) == #"<link rel="alternate" href="/es/feed.xml" type="application/rss+xml" hreflang="es" title="Spanish RSS Feed" />"#)
  }
}
