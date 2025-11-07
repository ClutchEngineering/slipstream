import Testing

import Slipstream

struct FileInputTests {
  @Test func basic() throws {
    try #expect(renderHTML(FileInput()) == #"<input type="file" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(FileInput(name: "avatar")) == #"<input type="file" name="avatar" />"#)
  }

  @Test func withAccept() throws {
    try #expect(renderHTML(FileInput(accept: "image/*")) == #"<input type="file" accept="image/*" />"#)
  }

  @Test func withAcceptFileTypes() throws {
    try #expect(renderHTML(FileInput(accept: ".jpg,.png,.gif")) == #"<input type="file" accept=".jpg,.png,.gif" />"#)
  }

  @Test func multiple() throws {
    try #expect(renderHTML(FileInput(multiple: true)) == #"<input type="file" multiple />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(FileInput(id: "document-upload")) == #"<input type="file" id="document-upload" />"#)
  }

  @Test func required() throws {
    try #expect(renderHTML(FileInput(required: true)) == #"<input type="file" required />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(FileInput(autoFocus: true)) == #"<input type="file" autofocus />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(FileInput(name: "documents", accept: ".pdf,.doc", multiple: true, id: "doc-upload", required: true, autoFocus: true)) == #"<input type="file" name="documents" accept=".pdf,.doc" multiple id="doc-upload" required autofocus />"#)
  }

  @Test func imageUploadUseCase() throws {
    // Test a common use case for image uploads
    try #expect(renderHTML(FileInput(name: "profile-picture", accept: "image/*", id: "avatar-input")) == #"<input type="file" name="profile-picture" accept="image/*" id="avatar-input" />"#)
  }
}
