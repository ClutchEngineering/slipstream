import Foundation
import Testing
import Slipstream

struct ModulePreloadTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(ModulePreload(nil)) == "")
  }

  @Test func validURL() throws {
    try #expect(renderHTML(ModulePreload(URL(string: "/js/app.mjs"))) == #"<link rel="modulepreload" href="/js/app.mjs" />"#)
  }

  @Test func withCrossOrigin() throws {
    try #expect(renderHTML(ModulePreload(URL(string: "/js/app.mjs"), crossOrigin: .anonymous)) == #"<link rel="modulepreload" href="/js/app.mjs" crossorigin="" />"#)
  }

  @Test func withCrossOriginUseCredentials() throws {
    try #expect(renderHTML(ModulePreload(URL(string: "/js/app.mjs"), crossOrigin: .useCredentials)) == #"<link rel="modulepreload" href="/js/app.mjs" crossorigin="use-credentials" />"#)
  }
}
