import Testing

import Slipstream

struct HGroupTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(HGroup {}) == "<hgroup></hgroup>")
  }

  @Test func withHeadings() throws {
    try #expect(renderHTML(HGroup {
      H1("Main Title")
      H2("Subtitle")
    }) == """
<hgroup>
 <h1>Main Title</h1>
 <h2>Subtitle</h2>
</hgroup>
""")
  }

  @Test func withMixedContent() throws {
    try #expect(renderHTML(HGroup {
      H1("The Solar System")
      Paragraph {
        DOMString("Our cosmic neighborhood")
      }
    }) == """
<hgroup>
 <h1>The Solar System</h1>
 <p>Our cosmic neighborhood</p>
</hgroup>
""")
  }
}
