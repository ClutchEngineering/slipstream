import Testing

import Slipstream

struct RadioButtonTests {
  @Test func basic() throws {
    try #expect(renderHTML(RadioButton()) == #"<input type="radio" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(RadioButton(name: "color")) == #"<input type="radio" name="color" />"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(RadioButton(value: "red")) == #"<input type="radio" value="red" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(RadioButton(id: "color-red")) == #"<input type="radio" id="color-red" />"#)
  }

  @Test func checked() throws {
    try #expect(renderHTML(RadioButton(checked: true)) == #"<input type="radio" checked />"#)
  }

  @Test func required() throws {
    try #expect(renderHTML(RadioButton(required: true)) == #"<input type="radio" required />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(RadioButton(autoFocus: true)) == #"<input type="radio" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(RadioButton(name: "color", value: "red", id: "color-red", checked: true, required: true, autoFocus: true)) == #"<input type="radio" name="color" value="red" id="color-red" checked required autofocus />"#)
  }

  @Test func radioGroupUseCase() throws {
    // Test a typical use case for radio button group
    try #expect(renderHTML(RadioButton(name: "size", value: "small", id: "size-small")) == #"<input type="radio" name="size" value="small" id="size-small" />"#)
    try #expect(renderHTML(RadioButton(name: "size", value: "medium", id: "size-medium", checked: true)) == #"<input type="radio" name="size" value="medium" id="size-medium" checked />"#)
    try #expect(renderHTML(RadioButton(name: "size", value: "large", id: "size-large")) == #"<input type="radio" name="size" value="large" id="size-large" />"#)
  }
}
