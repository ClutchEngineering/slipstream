import Testing

import Slipstream

struct TableHeaderCellTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableHeaderCell {}) == "<th></th>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableHeaderCell {
      DOMString("Hello, world!")
    }) == """
<th>Hello, world!</th>
""")
  }
}
