import Foundation
import Testing
import Slipstream

struct OpenerTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Opener(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Opener(URL(string: "https://example.com"))) == #"<link rel="opener" href="https://example.com" />"#)
  }
}
