import Testing
import Slipstream

struct GridCellRowsTests {
  @Test func rows() throws {
    try #expect(renderHTML(Div {}.gridCellRows(1)) == #"<div class="row-span-1"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(2)) == #"<div class="row-span-2"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(3)) == #"<div class="row-span-3"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(4)) == #"<div class="row-span-4"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(5)) == #"<div class="row-span-5"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(6)) == #"<div class="row-span-6"></div>"#)
    try #expect(renderHTML(Div {}.gridCellRows(.full)) == #"<div class="row-span-full"></div>"#)
  }
}
