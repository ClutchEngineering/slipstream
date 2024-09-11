import Foundation
import Testing

import Slipstream

struct PickerTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Picker {}) == #"<select></select>"#)
  }
}
