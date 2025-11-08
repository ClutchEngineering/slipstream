import Testing

import Slipstream

struct TabIndexTests {
  @Test func withZero() throws {
    try #expect(renderHTML(Div {}.tabIndex(0)) == #"<div tabindex="0"></div>"#)
  }

  @Test func withNegativeOne() throws {
    try #expect(renderHTML(Div {}.tabIndex(-1)) == #"<div tabindex="-1"></div>"#)
  }

  @Test func withPositive() throws {
    try #expect(renderHTML(Div {}.tabIndex(1)) == #"<div tabindex="1"></div>"#)
  }

  @Test func focusable() throws {
    try #expect(renderHTML(Div {}.focusable()) == #"<div tabindex="-1"></div>"#)
  }
}
