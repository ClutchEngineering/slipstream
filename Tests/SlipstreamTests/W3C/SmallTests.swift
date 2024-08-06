import Testing

import Slipstream

struct SmallTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Small {}) == "<small></small>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Small {
      Text("Hello, world!")
    }) == """
<small>Hello, world!</small>
""")
  }
}
