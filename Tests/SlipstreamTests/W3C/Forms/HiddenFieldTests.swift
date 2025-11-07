import Testing

import Slipstream

struct HiddenFieldTests {
  @Test func basic() throws {
    try #expect(renderHTML(HiddenField(name: "user_id", value: "12345")) == #"<input type="hidden" name="user_id" value="12345" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(HiddenField(name: "session", value: "xyz", id: "session-id")) == #"<input type="hidden" name="session" value="xyz" id="session-id" />"#)
  }

  @Test func csrfTokenUseCase() throws {
    // Test a common use case for CSRF tokens
    try #expect(renderHTML(HiddenField(name: "csrf_token", value: "a1b2c3d4e5")) == #"<input type="hidden" name="csrf_token" value="a1b2c3d4e5" />"#)
  }

  @Test func emptyValue() throws {
    try #expect(renderHTML(HiddenField(name: "optional_field", value: "")) == #"<input type="hidden" name="optional_field" value="" />"#)
  }
}
