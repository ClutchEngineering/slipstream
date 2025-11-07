import Foundation
import Testing
import Slipstream

struct ExternalTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(External(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(External(URL(string: "https://example.com"))) == #"<link rel="external" href="https://example.com" />"#)
  }
}
