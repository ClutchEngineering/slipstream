import Testing

import Slipstream

struct ButtonTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Button {}) == "<button></button>")
  }
  @Test func withText() throws {
    try #expect(renderHTML(Button("Tap me")) == #"<button>Tap me</button>"#)
  }

  @Test func withCustomContent() throws {
    try #expect(renderHTML(Button {
      Text("Tap me")
    }) == #"<button><p>Tap me</p></button>"#)
  }
}
