import Testing

import Slipstream

struct CustomElementTests {
  @Test func withCustomElement() throws {
    try #expect(renderHTML(Button {}.customElement("expanding-button")) == #"<button is="expanding-button"></button>"#)
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Button {
      DOMString("Click me")
    }.customElement("expanding-button")) == #"<button is="expanding-button">Click me</button>"#)
  }
}
