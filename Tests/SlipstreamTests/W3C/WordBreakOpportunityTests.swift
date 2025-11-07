import Testing

import Slipstream

struct WordBreakOpportunityTests {
  @Test func render() throws {
    try #expect(renderHTML(WordBreakOpportunity()) == "<wbr />")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(WordBreakOpportunity().language("en")) == #"<wbr lang="en" />"#)
  }
}
