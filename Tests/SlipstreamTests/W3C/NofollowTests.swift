import Foundation
import Testing
import Slipstream

struct NofollowTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Nofollow(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Nofollow(URL(string: "https://untrusted-site.com"))) == #"<link rel="nofollow" href="https://untrusted-site.com" />"#)
  }
}
