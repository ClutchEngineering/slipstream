import Testing

import Slipstream

struct ButtonTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Button {}) == "<button></button>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Button("Tap me")) == #"<button>Tap me</button>"#)
  }

  @Test func withType() throws {
    try #expect(renderHTML(Button("Tap me", type: .submit)) == #"<button type="submit">Tap me</button>"#)
    try #expect(renderHTML(Button("Tap me", type: .reset)) == #"<button type="reset">Tap me</button>"#)
  }

  @Test func withAction() throws {
    try #expect(renderHTML(Button(action: "alert('hello world')") {
      DOMString("Tap me")
    }) == #"<button onclick="alert('hello world')">Tap me</button>"#)

    try #expect(renderHTML(Button("Tap me", action: "alert('hello world')")) == #"<button onclick="alert('hello world')">Tap me</button>"#)
  }

  @Test func withCustomContent() throws {
    try #expect(renderHTML(Button {
      Text("Tap me")
    }) == #"<button><p>Tap me</p></button>"#)
  }
}
