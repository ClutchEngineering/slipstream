import Testing

import Slipstream

struct ContenteditableTests {
  @Test func withEnumTrue() throws {
    try #expect(renderHTML(Div {}.contenteditable(.true)) == #"<div contenteditable="true"></div>"#)
  }

  @Test func withEnumFalse() throws {
    try #expect(renderHTML(Div {}.contenteditable(.false)) == #"<div contenteditable="false"></div>"#)
  }

  @Test func withEnumInherit() throws {
    try #expect(renderHTML(Div {}.contenteditable(.inherit)) == #"<div contenteditable="inherit"></div>"#)
  }

  @Test func withBoolTrue() throws {
    try #expect(renderHTML(Div {}.contenteditable(true)) == #"<div contenteditable="true"></div>"#)
  }

  @Test func withBoolFalse() throws {
    try #expect(renderHTML(Div {}.contenteditable(false)) == #"<div contenteditable="false"></div>"#)
  }
}
