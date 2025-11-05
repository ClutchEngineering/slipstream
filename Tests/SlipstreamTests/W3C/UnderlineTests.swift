import Testing

import Slipstream

struct UnderlineTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Underline {}) == "<u></u>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Underline {
      DOMString("Hello, world!")
    }) == """
<u>Hello, world!</u>
""")
  }
}
