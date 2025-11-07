import Foundation
import Testing
import Slipstream

struct AuthorTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Author(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Author(URL(string: "/about"))) == #"<link rel="author" href="/about" />"#)
  }
}
