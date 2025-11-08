import Foundation
import Testing
import Slipstream

struct NoOpenerTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(NoOpener(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(NoOpener(URL(string: "https://external-site.com"))) == #"<link rel="noopener" href="https://external-site.com" />"#)
  }
}
