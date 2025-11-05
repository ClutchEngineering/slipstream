import Testing

import Slipstream

struct BoldTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Bold {}) == "<b></b>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Bold {
      DOMString("Hello, world!")
    }) == """
<b>Hello, world!</b>
""")
  }
}
