import Testing

import Slipstream

struct ProgressViewTests {
  @Test func indeterminate() throws {
    try #expect(renderHTML(ProgressView()) == #"<progress></progress>"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(ProgressView(value: 0.5)) == #"<progress value="0.5"></progress>"#)
  }

  @Test func withValueAndMax() throws {
    try #expect(renderHTML(ProgressView(value: 70, max: 100)) == #"<progress value="70.0" max="100.0"></progress>"#)
  }

  @Test func withIdModifier() throws {
    try #expect(renderHTML(ProgressView(value: 0.75).id("upload-progress")) == #"<progress value="0.75" id="upload-progress"></progress>"#)
  }

  @Test func zeroValue() throws {
    try #expect(renderHTML(ProgressView(value: 0)) == #"<progress value="0.0"></progress>"#)
  }

  @Test func fullValue() throws {
    try #expect(renderHTML(ProgressView(value: 1.0)) == #"<progress value="1.0"></progress>"#)
  }

  @Test func customMaxWithDefaultValue() throws {
    // When max is different from default 1.0, it should be included
    try #expect(renderHTML(ProgressView(max: 100)) == #"<progress max="100.0"></progress>"#)
  }
}
