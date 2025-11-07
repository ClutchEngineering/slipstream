import Testing

import Slipstream

struct SubmitLabelTests {
  @Test func withEnter() throws {
    try #expect(renderHTML(Div {}.submitLabel(.enter)) == #"<div enterkeyhint="enter"></div>"#)
  }

  @Test func withDone() throws {
    try #expect(renderHTML(Div {}.submitLabel(.done)) == #"<div enterkeyhint="done"></div>"#)
  }

  @Test func withGo() throws {
    try #expect(renderHTML(Div {}.submitLabel(.go)) == #"<div enterkeyhint="go"></div>"#)
  }

  @Test func withNext() throws {
    try #expect(renderHTML(Div {}.submitLabel(.next)) == #"<div enterkeyhint="next"></div>"#)
  }

  @Test func withPrevious() throws {
    try #expect(renderHTML(Div {}.submitLabel(.previous)) == #"<div enterkeyhint="previous"></div>"#)
  }

  @Test func withSearch() throws {
    try #expect(renderHTML(Div {}.submitLabel(.search)) == #"<div enterkeyhint="search"></div>"#)
  }

  @Test func withSend() throws {
    try #expect(renderHTML(Div {}.submitLabel(.send)) == #"<div enterkeyhint="send"></div>"#)
  }
}
