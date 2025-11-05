import Testing

import Slipstream

struct SupTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Sup {}) == "<sup></sup>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Sup {
      DOMString("2")
    }) == """
<sup>2</sup>
""")
  }
}
