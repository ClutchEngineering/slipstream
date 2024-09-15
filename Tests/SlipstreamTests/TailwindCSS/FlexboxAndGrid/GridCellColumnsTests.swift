import Testing
import Slipstream

struct GridCellColumnsTests {
  @Test func columns() throws {
    try #expect(renderHTML(Div {}.gridCellColumns(1)) == #"<div class="col-span-1"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(2)) == #"<div class="col-span-2"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(3)) == #"<div class="col-span-3"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(4)) == #"<div class="col-span-4"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(5)) == #"<div class="col-span-5"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(6)) == #"<div class="col-span-6"></div>"#)
    try #expect(renderHTML(Div {}.gridCellColumns(.full)) == #"<div class="col-span-full"></div>"#)
  }
}
