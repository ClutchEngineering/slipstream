import Testing

import Slipstream

struct SubmitButtonTests {
  @Test func basic() throws {
    try #expect(renderHTML(SubmitButton("Submit")) == #"<input type="submit" value="Submit" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(SubmitButton("Submit", name: "submit-btn")) == #"<input type="submit" value="Submit" name="submit-btn" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(SubmitButton("Submit").id("submit-button")) == #"<input type="submit" value="Submit" id="submit-button" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(SubmitButton("Submit", autoFocus: true)) == #"<input type="submit" value="Submit" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(SubmitButton("Register", name: "register", autoFocus: true).id("register-btn")) == #"<input type="submit" value="Register" name="register" autofocus id="register-btn" />"#)
  }
}
