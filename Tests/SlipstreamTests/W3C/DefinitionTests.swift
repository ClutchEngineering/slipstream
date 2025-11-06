import Testing

import Slipstream

struct DefinitionTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Definition {}) == "<dfn></dfn>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Definition("DOM")) == """
<dfn>
 DOM
</dfn>
""")
  }

  @Test func withViewBuilderContent() throws {
    try #expect(renderHTML(Definition {
      DOMString("Document Object Model")
    }) == """
<dfn>
 Document Object Model
</dfn>
""")
  }

  @Test func inContext() throws {
    try #expect(renderHTML(Paragraph {
      DOMString("The ")
      Definition("DOM")
      DOMString(" is a programming interface for web documents.")
    }) == """
<p>The <dfn>DOM</dfn> is a programming interface for web documents.</p>
""")
  }
}
