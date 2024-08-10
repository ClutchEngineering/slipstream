import Testing
import Slipstream

struct PlacementTests {
  @Test func singleEdges() throws {
    try #expect(renderHTML(Div {}.placement(left: 10)) == #"<div class="left-2.5"></div>"#)
    try #expect(renderHTML(Div {}.placement(right: 20)) == #"<div class="right-5"></div>"#)
    try #expect(renderHTML(Div {}.placement(top: 40)) == #"<div class="top-10"></div>"#)
    try #expect(renderHTML(Div {}.placement(bottom: 80)) == #"<div class="bottom-20"></div>"#)
  }

  @Test func allEdges() throws {
    try #expect(renderHTML(Div {}.placement(left: 1, right: 2, top: 3, bottom: 4)) == #"<div class="bottom-1 left-px right-0.5 top-0.5"></div>"#)
  }

  @Test func insets() throws {
    try #expect(renderHTML(Div {}.placement(inset: 32)) == #"<div class="inset-8"></div>"#)
  }

  @Test func singleAxis() throws {
    try #expect(renderHTML(Div {}.placement(x: 64)) == #"<div class="inset-x-16"></div>"#)
    try #expect(renderHTML(Div {}.placement(y: 96)) == #"<div class="inset-y-24"></div>"#)
  }

  @Test func multiAxis() throws {
    try #expect(renderHTML(Div {}.placement(x: 50, y: 100)) == #"<div class="inset-x-12 inset-y-24"></div>"#)
  }
}
