import Testing

import Slipstream

struct StrongTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Strong {}) == "<strong></strong>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Strong {
      DOMString("Hello, world!")
    }) == """
<strong>Hello, world!</strong>
""")
  }
}
