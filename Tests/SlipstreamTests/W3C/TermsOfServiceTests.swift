import Foundation
import Testing
import Slipstream

struct TermsOfServiceTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(TermsOfService(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(TermsOfService(URL(string: "/terms"))) == #"<link rel="terms-of-service" href="/terms" />"#)
  }
}
