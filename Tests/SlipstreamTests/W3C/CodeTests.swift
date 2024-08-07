import Testing

import Slipstream

struct CodeTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Code {}) == "<code></code>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Code {
      DOMString("Hello, world!")
    }) == """
<code>Hello, world!</code>
""")
  }
}
