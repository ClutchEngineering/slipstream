import Testing

import Slipstream

struct TableHeaderTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(TableHeader {}) == "<thead></thead>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TableHeader {
      DOMString("Hello, world!")
    }) == """
<thead>
 Hello, world!
</thead>
""")
  }
}
