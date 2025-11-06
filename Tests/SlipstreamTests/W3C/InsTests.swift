import Foundation
import Testing

import Slipstream

struct InsTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Ins {}) == "<ins></ins>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Ins("Added text")) == "<ins>Added text</ins>")
  }

  @Test func withCite() throws {
    let url = URL(string: "https://example.com/changes")!
    try #expect(renderHTML(Ins(cite: url) {
      DOMString("New content")
    }) == #"<ins cite="https://example.com/changes">New content</ins>"#)
  }

  @Test func withDatetime() throws {
    let date = Date(timeIntervalSince1970: 1640000000) // 2021-12-20T11:33:20Z
    try #expect(renderHTML(Ins(datetime: date) {
      DOMString("Added on specific date")
    }) == #"<ins datetime="2021-12-20T11:33:20Z">Added on specific date</ins>"#)
  }

  @Test func withCiteAndDatetime() throws {
    let url = URL(string: "https://example.com/changes")!
    let date = Date(timeIntervalSince1970: 1640000000)
    try #expect(renderHTML(Ins("Updated text", cite: url, datetime: date)) ==
      #"<ins cite="https://example.com/changes" datetime="2021-12-20T11:33:20Z">Updated text</ins>"#)
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Ins {
      Bold("Important addition")
    }) == "<ins><b>Important addition</b></ins>")
  }
}
