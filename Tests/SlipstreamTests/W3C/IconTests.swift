import Foundation
import Testing

import Slipstream

struct IconTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Icon(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Icon(URL(string: "/favicon.ico"))) == #"<link rel="icon" href="/favicon.ico" />"#)
  }

  @Test func sizes() throws {
    try #expect(renderHTML(Icon(URL(string: "/favicon.ico"), sizes: "16x16")) == #"<link rel="icon" href="/favicon.ico" sizes="16x16" />"#)
  }

  @Test func type() throws {
    try #expect(renderHTML(Icon(URL(string: "/favicon.ico"), type: "image/png")) == #"<link rel="icon" href="/favicon.ico" type="image/png" />"#)
  }
}
