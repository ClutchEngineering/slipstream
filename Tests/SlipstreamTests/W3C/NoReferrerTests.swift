import Foundation
import Testing
import Slipstream

struct NoReferrerTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(NoReferrer(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(NoReferrer(URL(string: "https://external-site.com"))) == #"<link rel="noreferrer" href="https://external-site.com" />"#)
  }
}
