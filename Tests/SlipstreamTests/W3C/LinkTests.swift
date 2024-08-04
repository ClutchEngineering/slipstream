import Foundation
import Testing

import Slipstream

struct LinkTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Link("Nowhere", destination: nil)) == "<a>Nowhere</a>")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Link("About", destination: URL(string: "/about"))) == #"<a href="/about">About</a>"#)
  }
}
