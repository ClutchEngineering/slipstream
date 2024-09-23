import Testing

import Slipstream

struct TableCellTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableCell {}) == "<td></td>")
  }

  @Test func spans() throws {
    try #expect(renderHTML(TableCell(rowSpan: 2) {}) == #"<td rowspan="2"></td>"#)
    try #expect(renderHTML(TableCell(colSpan: 3) {}) == #"<td colspan="3"></td>"#)
    try #expect(renderHTML(TableCell(rowSpan: 2, colSpan: 4) {}) == #"<td rowspan="2" colspan="4"></td>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableCell {
      DOMString("Hello, world!")
    }) == """
<td>Hello, world!</td>
""")
  }
}
