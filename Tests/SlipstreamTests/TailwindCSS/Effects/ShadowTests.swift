import Testing

import Slipstream

struct ShadowTests {
  @Test func color() throws {
    try #expect(renderHTML(Div {}.shadow(color: .black)) == #"<div class="shadow-black"></div>"#)
  }

  @Test func radius() throws {
    try #expect(renderHTML(Div {}.shadow(radius: 0)) == #"<div class="shadow-sm"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 1)) == #"<div class="shadow-sm"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 2)) == #"<div class="shadow-sm"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 3)) == #"<div class="shadow"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 4)) == #"<div class="shadow"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 5)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 6)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 7)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 8)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 9)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 10)) == #"<div class="shadow-md"></div>"#)
    try #expect(renderHTML(Div {}.shadow(radius: 100)) == #"<div class="shadow-2xl"></div>"#)
  }

  @Test func customName() throws {
    try #expect(renderHTML(Div {}.shadow("puck")) == #"<div class="shadow-puck"></div>"#)
  }
}
