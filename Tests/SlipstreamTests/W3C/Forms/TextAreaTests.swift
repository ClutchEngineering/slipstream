import Testing

import Slipstream

struct TextAreaTests {
  @Test func empty() throws {
    try #expect(renderHTML(TextArea()) == "<textarea></textarea>")
  }

  @Test func withPlaceholder() throws {
    try #expect(renderHTML(TextArea("Enter your comments")) == #"<textarea placeholder="Enter your comments"></textarea>"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(TextArea(value: "Default text")) == "<textarea>Default text</textarea>")
  }

  @Test func withPlaceholderAndValue() throws {
    try #expect(renderHTML(TextArea("Placeholder", value: "Initial value")) == #"<textarea placeholder="Placeholder">Initial value</textarea>"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(TextArea(name: "comments")) == #"<textarea name="comments"></textarea>"#)
  }

  @Test func withRows() throws {
    try #expect(renderHTML(TextArea(rows: 5)) == #"<textarea rows="5"></textarea>"#)
  }

  @Test func withCols() throws {
    try #expect(renderHTML(TextArea(cols: 40)) == #"<textarea cols="40"></textarea>"#)
  }

  @Test func withRowsAndCols() throws {
    try #expect(renderHTML(TextArea(rows: 5, cols: 40)) == #"<textarea rows="5" cols="40"></textarea>"#)
  }

  @Test func withWrapSoft() throws {
    try #expect(renderHTML(TextArea(wrap: .soft)) == #"<textarea wrap="soft"></textarea>"#)
  }

  @Test func withWrapHard() throws {
    try #expect(renderHTML(TextArea(wrap: .hard)) == #"<textarea wrap="hard"></textarea>"#)
  }

  @Test func withMaxLength() throws {
    try #expect(renderHTML(TextArea(maxLength: 500)) == #"<textarea maxlength="500"></textarea>"#)
  }

  @Test func withAutoFocus() throws {
    try #expect(renderHTML(TextArea(autoFocus: true)) == "<textarea autofocus></textarea>")
  }

  @Test func withRequired() throws {
    try #expect(renderHTML(TextArea(required: true)) == "<textarea required></textarea>")
  }

  @Test func withReadOnly() throws {
    try #expect(renderHTML(TextArea(readOnly: true)) == "<textarea readonly></textarea>")
  }

  @Test func withDisabled() throws {
    try #expect(renderHTML(TextArea(disabled: true)) == "<textarea disabled></textarea>")
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(TextArea(
      "Enter comments",
      value: "Initial text",
      name: "feedback",
      rows: 10,
      cols: 50,
      wrap: .hard,
      maxLength: 1000,
      autoFocus: true,
      required: true,
      readOnly: false,
      disabled: false
    )) == #"<textarea placeholder="Enter comments" name="feedback" rows="10" cols="50" wrap="hard" maxlength="1000" autofocus required>Initial text</textarea>"#)
  }

  @Test func formUseCase() throws {
    // Test a typical use case for a form textarea
    try #expect(renderHTML(TextArea(
      "Share your thoughts...",
      name: "message",
      rows: 4,
      cols: 50,
      maxLength: 500,
      required: true
    )) == #"<textarea placeholder="Share your thoughts..." name="message" rows="4" cols="50" maxlength="500" required></textarea>"#)
  }

  @Test func multilineValue() throws {
    let multilineText = """
    Line 1
    Line 2
    Line 3
    """
    try #expect(renderHTML(TextArea(value: multilineText)) == "<textarea>\(multilineText)</textarea>")
  }
}
