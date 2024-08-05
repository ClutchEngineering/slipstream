import Testing
import Slipstream

struct FloatTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.float(.start)) == #"<div class="float-start"></div>"#)
    try #expect(renderHTML(Div {}.float(.end)) == #"<div class="float-end"></div>"#)
    try #expect(renderHTML(Div {}.float(.left)) == #"<div class="float-left"></div>"#)
    try #expect(renderHTML(Div {}.float(.right)) == #"<div class="float-right"></div>"#)
    try #expect(renderHTML(Div {}.float(.none)) == #"<div class="float-none"></div>"#)
  }
}
