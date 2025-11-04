import Testing

import Slipstream

struct CaptionTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Caption {}) == "<caption></caption>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Caption {
      DOMString("Hello, world!")
    }) == """
<caption>
 Hello, world!
</caption>
""")
  }

  @Test func withStringLiteral() throws {
    try #expect(renderHTML(Caption("Table Caption")) == "<caption>Table Caption</caption>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Caption {}.language("en")) == #"<caption lang="en"></caption>"#)
  }
}
