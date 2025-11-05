import Testing

import Slipstream

struct SummaryTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Summary {}) == "<summary></summary>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Summary {
      DOMString("Click to expand")
    }) == "<summary>Click to expand</summary>")
  }

  @Test func withStringLiteral() throws {
    try #expect(renderHTML(Summary("Show details")) == "<summary>Show details</summary>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Summary {}.language("en")) == #"<summary lang="en"></summary>"#)
  }
}
