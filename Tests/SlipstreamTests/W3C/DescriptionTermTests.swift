import Testing

import Slipstream

struct DescriptionTermTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DescriptionTerm {}) == "<dt></dt>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(DescriptionTerm("HTML")) == "<dt>HTML</dt>")
  }

  @Test func withViewBuilderContent() throws {
    try #expect(renderHTML(DescriptionTerm {
      DOMString("Swift Programming")
    }) == """
<dt>Swift Programming</dt>
""")
  }
}
