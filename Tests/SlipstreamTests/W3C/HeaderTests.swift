import Testing

import Slipstream

struct HeaderTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Header {}) == "<header></header>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Header {
      DOMString("Hello, world!")
    }) == """
<header>
 Hello, world!
</header>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Header {}.language("en")) == #"<header lang="en"></header>"#)
  }
}
