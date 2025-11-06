import Testing

import Slipstream

struct DescriptionListTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DescriptionList {}) == "<dl></dl>")
  }

  @Test func withTermsAndDetails() throws {
    try #expect(renderHTML(DescriptionList {
      DescriptionTerm("Swift")
      DescriptionDetails {
        DOMString("A powerful programming language")
      }
    }) == """
<dl>\
<dt>Swift</dt>\
<dd>A powerful programming language</dd>\
</dl>
""")
  }

  @Test func withMultipleTerms() throws {
    try #expect(renderHTML(DescriptionList {
      DescriptionTerm("HTML")
      DescriptionDetails {
        DOMString("HyperText Markup Language")
      }
      DescriptionTerm("CSS")
      DescriptionDetails {
        DOMString("Cascading Style Sheets")
      }
    }) == """
<dl>\
<dt>HTML</dt>\
<dd>HyperText Markup Language</dd>\
<dt>CSS</dt>\
<dd>Cascading Style Sheets</dd>\
</dl>
""")
  }
}
