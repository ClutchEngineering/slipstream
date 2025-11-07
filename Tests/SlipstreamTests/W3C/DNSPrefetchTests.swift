import Foundation
import Testing
import Slipstream

struct DNSPrefetchTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(DNSPrefetch(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(DNSPrefetch(URL(string: "https://example.com"))) == #"<link rel="dns-prefetch" href="https://example.com" />"#)
  }
}
