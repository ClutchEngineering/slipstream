import Foundation
import Testing

import Slipstream

struct StrikethroughTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Strikethrough {}) == "<s></s>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Strikethrough("No longer valid")) == "<s>No longer valid</s>")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Strikethrough {
      Bold("Old price: $50")
    }) == "<s><b>Old price: $50</b></s>")
  }
}
