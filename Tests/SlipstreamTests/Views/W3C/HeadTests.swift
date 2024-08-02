import Testing

import Slipstream

struct HeadTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Head {}) == "<head></head>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(HTML {
      Head {
      }
    }) == """
<html>
 <head></head>
</html>
""")
  }
}
