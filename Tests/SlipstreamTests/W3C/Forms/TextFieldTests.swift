import Testing

import Slipstream

struct TextFieldTests {
  @Test func placeholder() throws {
    try #expect(renderHTML(TextField("Placeholder")) == #"<input type="text" placeholder="Placeholder" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(TextField("Placeholder", autoFocus: true)) == #"<input type="text" placeholder="Placeholder" autofocus />"#)
  }
}
