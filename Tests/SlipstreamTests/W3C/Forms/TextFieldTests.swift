import Testing

import Slipstream

struct TextFieldTests {
  @Test func placeholder() throws {
    try #expect(renderHTML(TextField("Placeholder")) == #"<input type="text" placeholder="Placeholder" />"#)
  }
}
