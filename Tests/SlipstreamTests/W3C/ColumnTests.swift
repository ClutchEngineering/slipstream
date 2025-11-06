import Foundation
import Testing

import Slipstream

struct ColumnTests {
  @Test func basic() throws {
    try #expect(renderHTML(Column()) == "<col />")
  }

  @Test func withSpan() throws {
    try #expect(renderHTML(Column(span: 2)) == #"<col span="2" />"#)
  }

  @Test func withSpanThree() throws {
    try #expect(renderHTML(Column(span: 3)) == #"<col span="3" />"#)
  }
}
