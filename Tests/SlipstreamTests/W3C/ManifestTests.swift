import Foundation
import Testing
import Slipstream

struct ManifestTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Manifest(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(Manifest(URL(string: "/manifest.json"))) == #"<link rel="manifest" href="/manifest.json" />"#)
  }

  @Test func withCrossOrigin() throws {
    try #expect(renderHTML(Manifest(URL(string: "/manifest.json"), crossOrigin: .anonymous)) == #"<link rel="manifest" href="/manifest.json" crossorigin="" />"#)
  }

  @Test func withCrossOriginUseCredentials() throws {
    try #expect(renderHTML(Manifest(URL(string: "/manifest.json"), crossOrigin: .useCredentials)) == #"<link rel="manifest" href="/manifest.json" crossorigin="use-credentials" />"#)
  }
}
