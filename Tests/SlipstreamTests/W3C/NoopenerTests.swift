import Foundation
import Testing
import Slipstream

struct NoopenerTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Noopener(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Noopener(URL(string: "https://external-site.com"))) == #"<link rel="noopener" href="https://external-site.com" />"#)
  }
}
