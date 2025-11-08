import Foundation
import Testing
import Slipstream

struct SearchLinkTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(SearchLink(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(SearchLink(URL(string: "/search"))) == #"<link rel="search" href="/search" />"#)
  }

  @Test func withType() throws {
    try #expect(renderHTML(SearchLink(URL(string: "/search"), type: "application/opensearchdescription+xml")) == #"<link rel="search" href="/search" type="application/opensearchdescription+xml" />"#)
  }
}
