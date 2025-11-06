import Testing

import Slipstream

struct DescriptionListTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DescriptionList {}) == "<dl></dl>")
  }

  @Test func withTermsAndDetails() throws {
    try #expect(renderHTML(DescriptionList {
      DescriptionTerm("Swift")
      DefinitionDescription {
        DOMString("A powerful programming language")
      }
    }) == """
<dl>
 <dt>
  Swift
 </dt>
 <dd>
  A powerful programming language
 </dd>
</dl>
""")
  }

  @Test func withMultipleTerms() throws {
    try #expect(renderHTML(DescriptionList {
      DescriptionTerm("HTML")
      DefinitionDescription {
        DOMString("HyperText Markup Language")
      }
      DescriptionTerm("CSS")
      DefinitionDescription {
        DOMString("Cascading Style Sheets")
      }
    }) == """
<dl>
 <dt>
  HTML
 </dt>
 <dd>
  HyperText Markup Language
 </dd>
 <dt>
  CSS
 </dt>
 <dd>
  Cascading Style Sheets
 </dd>
</dl>
""")
  }
}
