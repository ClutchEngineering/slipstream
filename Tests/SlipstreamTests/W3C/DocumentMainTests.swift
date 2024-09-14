import Testing

import Slipstream

struct DocumentMainTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DocumentMain {}) == "<main></main>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(DocumentMain {
      DOMString("Hello, world!")
    }) == """
<main>
 Hello, world!
</main>
""")
  }
}
