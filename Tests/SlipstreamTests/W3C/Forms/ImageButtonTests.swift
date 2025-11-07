import Testing

import Slipstream

struct ImageButtonTests {
  @Test func basic() throws {
    try #expect(renderHTML(ImageButton(src: "/submit.png", alt: "Submit")) == #"<input type="image" src="/submit.png" alt="Submit" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(ImageButton(src: "/submit.png", alt: "Submit", name: "submit-btn")) == #"<input type="image" src="/submit.png" alt="Submit" name="submit-btn" />"#)
  }

  @Test func withDimensions() throws {
    try #expect(renderHTML(ImageButton(src: "/submit.png", alt: "Submit", width: 100, height: 50)) == #"<input type="image" src="/submit.png" alt="Submit" width="100" height="50" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(ImageButton(src: "/submit.png", alt: "Submit").id("submit-button")) == #"<input type="image" src="/submit.png" alt="Submit" id="submit-button" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(ImageButton(src: "/submit.png", alt: "Submit", autoFocus: true)) == #"<input type="image" src="/submit.png" alt="Submit" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(ImageButton(src: "/register.png", alt: "Register", name: "register", width: 120, height: 60, autoFocus: true).id("register-btn")) == #"<input type="image" src="/register.png" alt="Register" name="register" width="120" height="60" autofocus id="register-btn" />"#)
  }
}
