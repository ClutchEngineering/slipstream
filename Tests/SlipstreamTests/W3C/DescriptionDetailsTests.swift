import Testing

import Slipstream

struct DescriptionDetailsTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DescriptionDetails {}) == "<dd></dd>")
  }

  @Test func withContent() throws {
    try #expect(renderHTML(DescriptionDetails {
      DOMString("HyperText Markup Language")
    }) == """
<dd>
 HyperText Markup Language
</dd>
""")
  }

  @Test func withComplexContent() throws {
    try #expect(renderHTML(DescriptionDetails {
      DOMString("A ")
      Strong("powerful")
      DOMString(" programming language")
    }) == """
<dd>
 A <strong>powerful</strong> programming language
</dd>
""")
  }
}
