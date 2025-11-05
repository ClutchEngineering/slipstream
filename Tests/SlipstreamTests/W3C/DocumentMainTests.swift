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

  @Test func withStringInitializer() throws {
    try #expect(renderHTML(DocumentMain("Hello, world!")) == """
<main>
 Hello, world!
</main>
""")
  }

  @Test func mainTypeAlias() throws {
    try #expect(renderHTML(Main {
      DOMString("Hello, world!")
    }) == """
<main>
 Hello, world!
</main>
""")
  }

  @Test func mainTypeAliasWithStringInitializer() throws {
    try #expect(renderHTML(Main("Hello, world!")) == """
<main>
 Hello, world!
</main>
""")
  }
}
