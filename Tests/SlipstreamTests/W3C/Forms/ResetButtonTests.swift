import Testing

import Slipstream

struct ResetButtonTests {
  @Test func basic() throws {
    try #expect(renderHTML(ResetButton("Reset")) == #"<input type="reset" value="Reset" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(ResetButton("Reset", name: "reset-btn")) == #"<input type="reset" value="Reset" name="reset-btn" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(ResetButton("Reset").id("reset-button")) == #"<input type="reset" value="Reset" id="reset-button" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(ResetButton("Reset", autoFocus: true)) == #"<input type="reset" value="Reset" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(ResetButton("Clear form", name: "clear", autoFocus: true).id("clear-btn")) == #"<input type="reset" value="Clear form" name="clear" autofocus id="clear-btn" />"#)
  }
}
