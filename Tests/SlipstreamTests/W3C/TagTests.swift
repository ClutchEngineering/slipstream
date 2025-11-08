import Foundation
import Testing
import Slipstream

struct TagTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Tag(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Tag(URL(string: "/tags/swift"))) == #"<link rel="tag" href="/tags/swift" />"#)
  }
}
