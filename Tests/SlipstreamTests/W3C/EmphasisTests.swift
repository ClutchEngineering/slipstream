import Testing

import Slipstream

struct EmphasisTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Emphasis {}) == "<em></em>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Emphasis {
      DOMString("Hello, world!")
    }) == """
<em>Hello, world!</em>
""")
  }

  @Test func withStringLiteral() throws {
    try #expect(renderHTML(Emphasis {
      "Hello, world!"
    }) == """
<em>Hello, world!</em>
""")
  }
}
