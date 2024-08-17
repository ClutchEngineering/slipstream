import Testing

import Slipstream

struct TableBodyTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableBody {}) == "<tbody></tbody>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableBody {
      DOMString("Hello, world!")
    }) == """
<tbody>
 Hello, world!
</tbody>
""")
  }
}
