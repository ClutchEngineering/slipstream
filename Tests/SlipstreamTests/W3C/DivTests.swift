import Testing

import Slipstream

struct DivTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Div {}) == "<div></div>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Div {
      Text("Hello, world!")
    }) == """
<div>
 Hello, world!
</div>
""")
  }
}
