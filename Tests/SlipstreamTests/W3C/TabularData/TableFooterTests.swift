import Testing
import Slipstream

struct TableFooterTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableFooter {}) == "<tfoot></tfoot>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableFooter {
      DOMString("Hello, world!")
    }) == """
<tfoot>
 Hello, world!
</tfoot>
""")
  }

  @Test func withRow() throws {
    try #expect(renderHTML(TableFooter {
      TableRow {
        TableCell { DOMString("Total") }
        TableCell { DOMString("$100") }
      }
    }) == """
<tfoot>
 <tr>
  <td>Total</td>
  <td>$100</td>
 </tr>
</tfoot>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(TableFooter {}.language("en")) == #"<tfoot lang="en"></tfoot>"#)
  }
}
