import Foundation
import Testing

import Slipstream

struct DelTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Del {}) == "<del></del>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Del("Removed text")) == "<del>Removed text</del>")
  }

  @Test func withCite() throws {
    let url = URL(string: "https://example.com/changes")!
    try #expect(renderHTML(Del(cite: url) {
      DOMString("Deleted content")
    }) == #"<del cite="https://example.com/changes">Deleted content</del>"#)
  }

  @Test func withDatetime() throws {
    let date = Date(timeIntervalSince1970: 1640000000) // 2021-12-20T11:33:20Z
    try #expect(renderHTML(Del(datetime: date) {
      DOMString("Removed on specific date")
    }) == #"<del datetime="2021-12-20T11:33:20Z">Removed on specific date</del>"#)
  }

  @Test func withCiteAndDatetime() throws {
    let url = URL(string: "https://example.com/changes")!
    let date = Date(timeIntervalSince1970: 1640000000)
    try #expect(renderHTML(Del("Deleted text", cite: url, datetime: date)) ==
      #"<del cite="https://example.com/changes" datetime="2021-12-20T11:33:20Z">Deleted text</del>"#)
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Del {
      Strikethrough("Removed paragraph")
    }) == "<del><s>Removed paragraph</s></del>")
  }
}
