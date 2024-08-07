import Testing

import Slipstream

struct NavigationTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Navigation {}) == "<nav></nav>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Navigation {
      DOMString("Hello, world!")
    }) == """
<nav>
 Hello, world!
</nav>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Navigation {}.language("en")) == #"<nav lang="en"></nav>"#)
  }
}
