import Testing

import Slipstream

struct ItalicTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Italic {}) == "<i></i>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Italic {
      DOMString("Hello, world!")
    }) == """
<i>Hello, world!</i>
""")
  }
}
