import Testing

import Slipstream

struct AsideTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Aside {}) == "<aside></aside>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Aside {
      DOMString("Hello, world!")
    }) == """
<aside>
 Hello, world!
</aside>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Aside {}.language("en")) == #"<aside lang="en"></aside>"#)
  }
}
