import Testing

import Slipstream

struct TextAlignmentTests {
  @Test func alignments() throws {
    try #expect(renderHTML(Div {}.textAlignment(.left)) == #"<div class="text-left"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.leading)) == #"<div class="text-start"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.center)) == #"<div class="text-center"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.right)) == #"<div class="text-right"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.trailing)) == #"<div class="text-end"></div>"#)
    try #expect(renderHTML(Div {}.textAlignment(.justify)) == #"<div class="text-justify"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(
        Div {
        }.textAlignment(
          .left,
          condition: .init(startingAt: .extraExtraLarge)
        )) == #"<div class="2xl:text-left"></div>"#
    )
  }
}
