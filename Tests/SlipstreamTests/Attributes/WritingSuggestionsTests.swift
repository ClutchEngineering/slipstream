import Testing

import Slipstream

struct WritingSuggestionsTests {
  @Test func withTrue() throws {
    try #expect(renderHTML(Div {}.writingSuggestions(true)) == #"<div writingsuggestions="true"></div>"#)
  }

  @Test func withFalse() throws {
    try #expect(renderHTML(Div {}.writingSuggestions(false)) == #"<div writingsuggestions="false"></div>"#)
  }
}
