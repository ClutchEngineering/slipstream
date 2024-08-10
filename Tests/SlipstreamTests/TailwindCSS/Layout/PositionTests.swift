import Testing
import Slipstream

struct PositionTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.position(.static)) == #"<div class="static"></div>"#)
    try #expect(renderHTML(Div {}.position(.fixed)) == #"<div class="fixed"></div>"#)
    try #expect(renderHTML(Div {}.position(.absolute)) == #"<div class="absolute"></div>"#)
    try #expect(renderHTML(Div {}.position(.relative)) == #"<div class="relative"></div>"#)
    try #expect(renderHTML(Div {}.position(.sticky)) == #"<div class="sticky"></div>"#)
  }
}
