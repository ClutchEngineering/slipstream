import Testing

import Slipstream

struct ColorPickerTests {
  @Test func basic() throws {
    try #expect(renderHTML(ColorPicker()) == #"<input type="color" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(ColorPicker(name: "theme-color")) == #"<input type="color" name="theme-color" />"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(ColorPicker(value: "#ff5733")) == #"<input type="color" value="#ff5733" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(ColorPicker(id: "accent-picker")) == #"<input type="color" id="accent-picker" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(ColorPicker(autoFocus: true)) == #"<input type="color" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(ColorPicker(name: "accent", value: "#3498db", id: "accent-color", autoFocus: true)) == #"<input type="color" name="accent" value="#3498db" id="accent-color" autofocus />"#)
  }
}
