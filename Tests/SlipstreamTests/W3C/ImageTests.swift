import Foundation
import Testing

import Slipstream

struct ImageTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Image(nil)) == "")
  }

  @Test func url() throws {
    try #expect(renderHTML(Image(URL(string: "/logo.png"))) == #"<img src="/logo.png" />"#)
  }

  @Test func crossOrigin() throws {
    try #expect(renderHTML(Image(URL(string: "/logo.png"), crossOrigin: .anonymous)) == #"<img src="/logo.png" crossorigin="" />"#)
    try #expect(renderHTML(Image(URL(string: "/logo.png"), crossOrigin: .useCredentials)) == #"<img src="/logo.png" crossorigin="use-credentials" />"#)
  }

  @Test func accessibilityLabel() throws {
    try #expect(renderHTML(Image(URL(string: "/logo.png")).accessibilityLabel("My logo")) == #"<img src="/logo.png" alt="My logo" />"#)
  }
}
