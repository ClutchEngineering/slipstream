import Foundation
import Testing
import Slipstream

struct PrevTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Prev(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Prev(URL(string: "/page1"))) == #"<link rel="prev" href="/page1" />"#)
  }
}
