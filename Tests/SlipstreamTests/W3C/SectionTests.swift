import Testing

import Slipstream

struct SectionTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Section {}) == "<section></section>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Section {
      DOMString("Hello, world!")
    }) == """
<section>
 Hello, world!
</section>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Section {}.language("en")) == #"<section lang="en"></section>"#)
  }
}
