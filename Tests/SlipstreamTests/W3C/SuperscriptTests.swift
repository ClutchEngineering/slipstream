import Testing

import Slipstream

struct SuperscriptTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Superscript {}) == "<sup></sup>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Superscript {
      DOMString("2")
    }) == """
<sup>2</sup>
""")
  }
}
