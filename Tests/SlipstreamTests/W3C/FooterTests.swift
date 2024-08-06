import Testing

import Slipstream

struct FooterTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Footer {}) == "<footer></footer>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Footer {
      Text("Hello, world!")
    }) == """
<footer>
 Hello, world!
</footer>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Footer {}.language("en")) == #"<footer lang="en"></footer>"#)
  }
}
