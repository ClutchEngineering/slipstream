import Foundation
import Testing

import Slipstream

struct PreconnectTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Preconnect(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Preconnect(URL(string: "https://rsms.me/"))) == #"<link rel="preconnect" href="https://rsms.me/" />"#)
  }
}
