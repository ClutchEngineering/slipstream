import Testing

import Slipstream

struct AutocapitalizeTests {
  @Test func withNone() throws {
    try #expect(renderHTML(Div {}.autocapitalize(.none)) == #"<div autocapitalize="none"></div>"#)
  }

  @Test func withSentences() throws {
    try #expect(renderHTML(Div {}.autocapitalize(.sentences)) == #"<div autocapitalize="sentences"></div>"#)
  }

  @Test func withWords() throws {
    try #expect(renderHTML(Div {}.autocapitalize(.words)) == #"<div autocapitalize="words"></div>"#)
  }

  @Test func withCharacters() throws {
    try #expect(renderHTML(Div {}.autocapitalize(.characters)) == #"<div autocapitalize="characters"></div>"#)
  }
}
