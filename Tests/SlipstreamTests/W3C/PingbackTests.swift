import Foundation
import Testing
import Slipstream

struct PingbackTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Pingback(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Pingback(URL(string: "https://example.com/xmlrpc.php"))) == #"<link rel="pingback" href="https://example.com/xmlrpc.php" />"#)
  }
}
