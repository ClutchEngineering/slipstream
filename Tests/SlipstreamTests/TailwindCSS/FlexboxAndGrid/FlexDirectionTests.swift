import Testing
import Slipstream

struct FlexDirectionTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.flexDirection(.column)) == #"<div class="flex-col"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.column, reversed: true)) == #"<div class="flex-col-reverse"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.row)) == #"<div class="flex-row"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.row, reversed: true)) == #"<div class="flex-row-reverse"></div>"#)
  }

  @Test func conditions() throws {
    try #expect(
      renderHTML(Div {}.flexDirection(
        .column,
        condition: .init(minBreakpoint: .medium)
      )) == #"<div class="md:flex-col"></div>"#
    )
  }
}
