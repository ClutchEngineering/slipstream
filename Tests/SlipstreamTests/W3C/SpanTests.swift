import Testing

import Slipstream

struct SpanTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Span {}) == "<span></span>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Span {
      DOMString("Hello, world!")
    }) == """
<span>Hello, world!</span>
""")
  }
}
