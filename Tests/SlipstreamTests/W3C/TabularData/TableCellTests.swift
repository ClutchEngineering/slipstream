import Testing

import Slipstream

struct TableCellTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableCell {}) == "<td></td>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableCell {
      DOMString("Hello, world!")
    }) == """
<td>
 Hello, world!
</td>
""")
  }
}
