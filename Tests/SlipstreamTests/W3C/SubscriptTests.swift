import Testing

import Slipstream

struct SubscriptTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Subscript {}) == "<sub></sub>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Subscript {
      DOMString("2")
    }) == """
<sub>2</sub>
""")
  }
}
