import Testing
import Slipstream

struct AlignItemsTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.alignItems(.stretch)) == #"<div class="items-stretch"></div>"#)
    try #expect(renderHTML(Div {}.alignItems(.start)) == #"<div class="items-start"></div>"#)
    try #expect(renderHTML(Div {}.alignItems(.center)) == #"<div class="items-center"></div>"#)
    try #expect(renderHTML(Div {}.alignItems(.end)) == #"<div class="items-end"></div>"#)
    try #expect(renderHTML(Div {}.alignItems(.baseline)) == #"<div class="items-baseline"></div>"#)
  }
}
