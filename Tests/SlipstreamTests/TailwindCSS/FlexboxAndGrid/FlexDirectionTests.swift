import Testing
import Slipstream

struct FlexDirectionTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.flexDirection(.y)) == #"<div class="flex-col"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.y, reversed: true)) == #"<div class="flex-col-reverse"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.x)) == #"<div class="flex-row"></div>"#)
    try #expect(renderHTML(Div {}.flexDirection(.x, reversed: true)) == #"<div class="flex-row-reverse"></div>"#)
  }

  @Test func conditions() throws {
    try #expect(renderHTML(Div {}.flexDirection(.y, condition: .init(minBreakpoint: .medium))) == #"<div class="md:flex-col"></div>"#)
  }
}
