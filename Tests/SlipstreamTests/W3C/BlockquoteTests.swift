import Testing

import Slipstream

struct BlockquoteTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Blockquote {}) == "<blockquote></blockquote>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Blockquote {
      Text("Hello, world!")
    }) == """
<blockquote>
 Hello, world!
</blockquote>
""")
  }
}
