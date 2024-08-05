import Foundation
import Testing

import Slipstream

struct ScriptTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Script(nil)) == "")
  }

  @Test func url() throws {
    try #expect(renderHTML(Script(URL(string: "/main.js"))) == #"<script src="/main.js"></script>"#)

    try #expect(renderHTML(Script(URL(string: "/main.js"), executionMode: .async)) == #"<script src="/main.js" async></script>"#)
    try #expect(renderHTML(Script(URL(string: "/main.js"), executionMode: .defer)) == #"<script src="/main.js" defer></script>"#)
  }

  @Test func source() throws {
    try #expect(renderHTML(Script("""
alert("Hello, world!");
""")) == #"<script>alert("Hello, world!");</script>"#)
  }
}
