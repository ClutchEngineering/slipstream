import Testing

import Slipstream

struct InlineStyleTests {
  @Test func withSingleProperty() throws {
    try #expect(renderHTML(Div {}.inlineStyle("color: red;")) == #"<div style="color: red;"></div>"#)
  }

  @Test func withMultipleProperties() throws {
    try #expect(renderHTML(Div {}.inlineStyle("color: red; font-weight: bold;")) == #"<div style="color: red; font-weight: bold;"></div>"#)
  }
}
