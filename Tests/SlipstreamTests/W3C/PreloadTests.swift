import Foundation
import Testing

import Slipstream

struct PreloadTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Preload(nil, as: .image)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Preload(URL(string: "/main.css"), as: .image)) == #"<link rel="preload" as="image" href="/main.css" />"#)
  }
}
