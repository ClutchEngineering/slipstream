import Foundation
import Testing

import Slipstream

struct OptionTests {
  @Test func noValue() throws {
    try #expect(renderHTML(Option("Label")) == #"<option>Label</option>"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(Option("Label", value: "value")) == #"<option value="value">Label</option>"#)
  }
}
