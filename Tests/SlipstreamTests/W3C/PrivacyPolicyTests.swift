import Foundation
import Testing
import Slipstream

struct PrivacyPolicyTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(PrivacyPolicy(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(PrivacyPolicy(URL(string: "/privacy"))) == #"<link rel="privacy-policy" href="/privacy" />"#)
  }
}
