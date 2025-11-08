import Testing

import Slipstream

struct SpellcheckTests {
  @Test func withTrue() throws {
    try #expect(renderHTML(Div {}.spellcheck(true)) == #"<div spellcheck="true"></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.spellcheck(false)) == #"<div spellcheck="false"></div>"#)
  }
}
