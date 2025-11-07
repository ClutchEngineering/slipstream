import Testing

import Slipstream

struct KeyboardTypeTests {
  @Test func withNone() throws {
    try #expect(renderHTML(Div {}.keyboardType(.none)) == #"<div inputmode="none"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(Div {}.keyboardType(.text)) == #"<div inputmode="text"></div>"#)
  }

  @Test func withDecimal() throws {
    try #expect(renderHTML(Div {}.keyboardType(.decimal)) == #"<div inputmode="decimal"></div>"#)
  }

  @Test func withNumeric() throws {
    try #expect(renderHTML(Div {}.keyboardType(.numeric)) == #"<div inputmode="numeric"></div>"#)
  }

  @Test func withTel() throws {
    try #expect(renderHTML(Div {}.keyboardType(.tel)) == #"<div inputmode="tel"></div>"#)
  }

  @Test func withSearch() throws {
    try #expect(renderHTML(Div {}.keyboardType(.search)) == #"<div inputmode="search"></div>"#)
  }

  @Test func withEmail() throws {
    try #expect(renderHTML(Div {}.keyboardType(.email)) == #"<div inputmode="email"></div>"#)
  }

  @Test func withURL() throws {
    try #expect(renderHTML(Div {}.keyboardType(.url)) == #"<div inputmode="url"></div>"#)
  }
}
