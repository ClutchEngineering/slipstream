import Foundation
import Testing

import Slipstream

struct RawHTMLTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(RawHTML("""
<my-cool-tag></my-cool-tag>
""")) == "<my-cool-tag></my-cool-tag>")
  }
}
