import Testing

import Slipstream

struct TextTests {
  @Test func emptyText() throws {
    try #expect(renderHTML(Text("")) == "")
  }

  @Test func htmlCharactersEscaped() throws {
    try #expect(renderHTML(Text("<p>Hello</p>")) == "&lt;p&gt;Hello&lt;/p&gt;")
  }
}
