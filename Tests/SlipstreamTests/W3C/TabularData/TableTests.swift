import Testing

import Slipstream

struct TableTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Table {}) == "<table></table>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Table {
      DOMString("Hello, world!")
    }) == """
<table>
 Hello, world!
</table>
""")
  }
}
