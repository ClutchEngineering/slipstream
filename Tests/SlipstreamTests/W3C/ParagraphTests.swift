import Testing

import Slipstream

struct ParagraphTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Paragraph {}) == "<p></p>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Paragraph {
      Text("Hello, world!")
    }) == """
<p>Hello, world!</p>
""")
  }
}
