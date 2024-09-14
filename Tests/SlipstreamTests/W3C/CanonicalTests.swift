import Foundation
import Testing

import Slipstream

struct CanonicalTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Canonical(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Canonical(URL(string: "https://mysite.com"))) == #"<link rel="canonical" href="https://mysite.com" />"#)
  }
}
