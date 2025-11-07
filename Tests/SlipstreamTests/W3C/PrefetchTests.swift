import Foundation
import Testing
import Slipstream

struct PrefetchTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Prefetch(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Prefetch(URL(string: "/next-page.html"))) == #"<link rel="prefetch" href="/next-page.html" />"#)
  }

  @Test func withCrossOrigin() throws {
    try #expect(renderHTML(Prefetch(URL(string: "/next-page.html"), crossOrigin: .anonymous)) == #"<link rel="prefetch" href="/next-page.html" crossorigin="" />"#)
  }

  @Test func withCrossOriginUseCredentials() throws {
    try #expect(renderHTML(Prefetch(URL(string: "/next-page.html"), crossOrigin: .useCredentials)) == #"<link rel="prefetch" href="/next-page.html" crossorigin="use-credentials" />"#)
  }
}
