import Foundation
import Testing
import Slipstream

struct NextTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Next(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Next(URL(string: "/page2"))) == #"<link rel="next" href="/page2" />"#)
  }
}
