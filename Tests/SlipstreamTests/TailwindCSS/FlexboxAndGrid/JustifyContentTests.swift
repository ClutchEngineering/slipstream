import Testing
import Slipstream

struct JustifyContentTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.justifyContent(.normal)) == #"<div class="justify-normal"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.start)) == #"<div class="justify-start"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.end)) == #"<div class="justify-end"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.center)) == #"<div class="justify-center"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.between)) == #"<div class="justify-between"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.around)) == #"<div class="justify-around"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.evenly)) == #"<div class="justify-evenly"></div>"#)
    try #expect(renderHTML(Div {}.justifyContent(.stretch)) == #"<div class="justify-stretch"></div>"#)
  }
}
