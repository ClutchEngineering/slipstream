import Testing

import Slipstream

struct StrongTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Strong {}) == "<strong></strong>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Strong {
      Text("Hello, world!")
    }) == """
<strong>Hello, world!</strong>
""")
  }
}
