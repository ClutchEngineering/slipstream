import Testing

import Slipstream

struct TextAlignmentTests {
  @Test func alignments() throws {
    try #expect(renderHTML(Div {}.textAlignment(.leading)) == #"<div class="text-start"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.center)) == #"<div class="text-center"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.trailing)) == #"<div class="text-end"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.justify)) == #"<div class="text-justify"></div>"#)
  }
}
