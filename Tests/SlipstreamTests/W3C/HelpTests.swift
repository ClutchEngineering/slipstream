import Foundation
import Testing
import Slipstream

struct HelpTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Help(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Help(URL(string: "/help"))) == #"<link rel="help" href="/help" />"#)
  }
}
