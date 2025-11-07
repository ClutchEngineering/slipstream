import Testing

import Slipstream

struct TextAreaTests {
  @Test func emptyTextArea() throws {
    try #expect(renderHTML(TextArea()) == "<textarea></textarea>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(TextArea("Default text")) == "<textarea>Default text</textarea>")
  }

  @Test func withName() throws {
    try #expect(renderHTML(TextArea(name: "comment")) == #"<textarea name="comment"></textarea>"#)
  }

  @Test func withRows() throws {
    try #expect(renderHTML(TextArea(rows: 5)) == #"<textarea rows="5"></textarea>"#)
  }

  @Test func withColumns() throws {
    try #expect(renderHTML(TextArea(columns: 40)) == #"<textarea cols="40"></textarea>"#)
  }

  @Test func withPlaceholder() throws {
    try #expect(renderHTML(TextArea(placeholder: "Enter your comment...")) == #"<textarea placeholder="Enter your comment..."></textarea>"#)
  }

  @Test func withAllAttributes() throws {
    try #expect(renderHTML(TextArea(
      "Initial text",
      name: "feedback",
      rows: 10,
      columns: 50,
      placeholder: "Your feedback here..."
    )) == #"<textarea name="feedback" rows="10" cols="50" placeholder="Your feedback here...">Initial text</textarea>"#)
  }

  @Test func withContent() throws {
    try #expect(renderHTML(TextArea(name: "comment") {
      DOMString("This is a comment")
    }) == #"<textarea name="comment">This is a comment</textarea>"#)
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(TextArea("Text").language("en")) == #"<textarea lang="en">Text</textarea>"#)
  }
}
