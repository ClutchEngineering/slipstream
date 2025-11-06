import Foundation
import Testing

import Slipstream

struct MarkTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Mark {}) == "<mark></mark>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Mark("highlighted text")) == "<mark>highlighted text</mark>")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Mark {
      DOMString("Search term: ")
      Strong("Slipstream")
    }) == "<mark>Search term: <strong>Slipstream</strong></mark>")
  }

  @Test func inParagraph() throws {
    try #expect(renderHTML(Paragraph {
      DOMString("Search results for ")
      Mark("Slipstream")
      DOMString(" found 42 matches")
    }) == "<p>Search results for <mark>Slipstream</mark> found 42 matches</p>")
  }

  @Test func multipleMarks() throws {
    try #expect(renderHTML(Paragraph {
      Mark("First")
      DOMString(" and ")
      Mark("Second")
    }) == "<p><mark>First</mark> and <mark>Second</mark></p>")
  }
}
