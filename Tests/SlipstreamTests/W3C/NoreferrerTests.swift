import Foundation
import Testing
import Slipstream

struct NoreferrerTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Noreferrer(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Noreferrer(URL(string: "https://external-site.com"))) == #"<link rel="noreferrer" href="https://external-site.com" />"#)
  }
}
