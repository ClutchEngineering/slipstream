import Testing

import Slipstream

struct CiteTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Cite {}) == "<cite></cite>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Cite {
      DOMString("The Great Gatsby")
    }) == """
<cite>The Great Gatsby</cite>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(Cite("1984")) == "<cite>1984</cite>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Cite {}.language("en")) == #"<cite lang="en"></cite>"#)
  }
}
