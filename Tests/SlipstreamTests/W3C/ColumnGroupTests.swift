import Foundation
import Testing

import Slipstream

struct ColumnGroupTests {
  @Test func empty() throws {
    try #expect(renderHTML(ColumnGroup {}) == "<colgroup></colgroup>")
  }

  @Test func withSpan() throws {
    try #expect(renderHTML(ColumnGroup(span: 2)) == #"<colgroup span="2"></colgroup>"#)
  }

  @Test func withColumns() throws {
    try #expect(renderHTML(ColumnGroup {
      Column()
      Column()
    }) == "<colgroup><col><col></colgroup>")
  }

  @Test func withColumnsAndSpan() throws {
    try #expect(renderHTML(ColumnGroup {
      Column(span: 2)
      Column()
    }) == #"<colgroup><col span="2"><col></colgroup>"#)
  }
}
