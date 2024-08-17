import Testing

import Slipstream

struct TableRowTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableRow {}) == "<tr></tr>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableRow {
      DOMString("Hello, world!")
    }) == """
<tr>
 Hello, world!
</tr>
""")
  }
}
