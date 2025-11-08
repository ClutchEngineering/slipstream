import Foundation
import Testing
import Slipstream

struct PreviousTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Previous(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Previous(URL(string: "/page1"))) == #"<link rel="prev" href="/page1" />"#)
  }
}
