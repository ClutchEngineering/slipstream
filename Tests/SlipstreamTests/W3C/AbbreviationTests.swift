import Testing

import Slipstream

struct AbbreviationTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Abbreviation {}) == "<abbr></abbr>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Abbreviation {
      DOMString("HTML")
    }) == """
<abbr>HTML</abbr>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(Abbreviation("CSS")) == "<abbr>CSS</abbr>")
  }

  @Test func withTitleAttribute() throws {
    try #expect(renderHTML(
      Abbreviation("HTML")
        .title("HyperText Markup Language")
    ) == #"<abbr title="HyperText Markup Language">HTML</abbr>"#)
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Abbreviation {}.language("en")) == #"<abbr lang="en"></abbr>"#)
  }
}
