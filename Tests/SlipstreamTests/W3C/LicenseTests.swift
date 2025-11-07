import Foundation
import Testing
import Slipstream

struct LicenseTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(License(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(License(URL(string: "https://creativecommons.org/licenses/by/4.0/"))) == #"<link rel="license" href="https://creativecommons.org/licenses/by/4.0/" />"#)
  }
}
