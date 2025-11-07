import Testing

import Slipstream

struct InputButtonTests {
  @Test func basic() throws {
    try #expect(renderHTML(InputButton("Click me")) == #"<input type="button" value="Click me" />"#)
  }

  @Test func withAction() throws {
    try #expect(renderHTML(InputButton("Click me", action: "handleClick()")) == #"<input type="button" value="Click me" onclick="handleClick()" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(InputButton("Click me", name: "action-btn")) == #"<input type="button" value="Click me" name="action-btn" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(InputButton("Click me").id("action-button")) == #"<input type="button" value="Click me" id="action-button" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(InputButton("Click me", autoFocus: true)) == #"<input type="button" value="Click me" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(InputButton("Do something", action: "doSomething()", name: "action", autoFocus: true).id("action-btn")) == #"<input type="button" value="Do something" onclick="doSomething()" name="action" autofocus id="action-btn" />"#)
  }
}
