import Testing

import Slipstream

struct CanvasTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Canvas {}) == "<canvas></canvas>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Canvas {
      DOMString("Hello, world!")
    }) == """
<canvas>
 Hello, world!
</canvas>
""")
  }
}
