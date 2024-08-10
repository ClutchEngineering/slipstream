import Foundation
import Testing

import Slipstream

struct StylesheetTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Stylesheet(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Stylesheet(URL(string: "/main.css"))) == #"<link rel="stylesheet" href="/main.css" />"#)
  }

  @Test func crossOrigin() throws {
    try #expect(renderHTML(Stylesheet(URL(string: "/main.css"), crossOrigin: .anonymous)) == #"<link rel="stylesheet" href="/main.css" crossorigin="" />"#)
    try #expect(renderHTML(Stylesheet(URL(string: "/main.css"), crossOrigin: .useCredentials)) == #"<link rel="stylesheet" href="/main.css" crossorigin="use-credentials" />"#)
  }
}
