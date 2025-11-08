import Foundation
import Testing
import Slipstream

struct BookmarkTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Bookmark(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Bookmark(URL(string: "/article#section1"))) == #"<link rel="bookmark" href="/article#section1" />"#)
  }
}
