import Testing

import Slipstream

struct ProgressViewTests {
  @Test func indeterminate() throws {
    try #expect(renderHTML(ProgressView()) == #"<progress></progress>"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(ProgressView(value: 0.7)) == #"<progress value="0.7"></progress>"#)
  }

  @Test func withCustomMax() throws {
    try #expect(renderHTML(ProgressView(max: 100)) == #"<progress max="100.0"></progress>"#)
  }

  @Test func withValueAndMax() throws {
    try #expect(renderHTML(ProgressView(value: 70, max: 100)) == #"<progress value="70.0" max="100.0"></progress>"#)
  }

  @Test func zeroValue() throws {
    try #expect(renderHTML(ProgressView(value: 0, max: 100)) == #"<progress value="0.0" max="100.0"></progress>"#)
  }

  @Test func fullValue() throws {
    try #expect(renderHTML(ProgressView(value: 100, max: 100)) == #"<progress value="100.0" max="100.0"></progress>"#)
  }

  @Test func percentageUseCase() throws {
    // Using default max of 1.0 for percentage-style progress
    try #expect(renderHTML(ProgressView(value: 0.0)) == #"<progress value="0.0"></progress>"#)
    try #expect(renderHTML(ProgressView(value: 0.5)) == #"<progress value="0.5"></progress>"#)
    try #expect(renderHTML(ProgressView(value: 1.0)) == #"<progress value="1.0"></progress>"#)
  }

  @Test func numericUseCase() throws {
    // Using custom max for numeric progress tracking
    try #expect(renderHTML(ProgressView(value: 25, max: 100)) == #"<progress value="25.0" max="100.0"></progress>"#)
    try #expect(renderHTML(ProgressView(value: 50, max: 100)) == #"<progress value="50.0" max="100.0"></progress>"#)
    try #expect(renderHTML(ProgressView(value: 75, max: 100)) == #"<progress value="75.0" max="100.0"></progress>"#)
  }
}
