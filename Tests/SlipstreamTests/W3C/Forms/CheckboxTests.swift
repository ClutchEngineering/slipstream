import Testing

import Slipstream

struct CheckboxTests {
  @Test func basic() throws {
    try #expect(renderHTML(Checkbox()) == #"<input type="checkbox" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(Checkbox(name: "menu-toggle")) == #"<input type="checkbox" name="menu-toggle" />"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(Checkbox(value: "accepted")) == #"<input type="checkbox" value="accepted" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(Checkbox(id: "menu-toggle")) == #"<input type="checkbox" id="menu-toggle" />"#)
  }

  @Test func checked() throws {
    try #expect(renderHTML(Checkbox(checked: true)) == #"<input type="checkbox" checked />"#)
  }

  @Test func required() throws {
    try #expect(renderHTML(Checkbox(required: true)) == #"<input type="checkbox" required />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(Checkbox(autoFocus: true)) == #"<input type="checkbox" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(Checkbox(name: "agreement", value: "accepted", id: "terms", checked: true, required: true, autoFocus: true)) == #"<input type="checkbox" name="agreement" value="accepted" id="terms" checked required autofocus />"#)
  }

  @Test func mobileMenuToggleUseCase() throws {
    // Test the specific use case for mobile menu toggle
    try #expect(renderHTML(Checkbox(name: "menu-toggle", id: "menu-toggle")) == #"<input type="checkbox" name="menu-toggle" id="menu-toggle" />"#)
  }
}
