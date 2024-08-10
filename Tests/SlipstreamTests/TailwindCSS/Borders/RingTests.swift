import Testing
import Slipstream

struct RingTests {
  @Test func colors() throws {
    try #expect(renderHTML(Div {}.ring(.black)) == #"<div class="ring-1 ring-black"></div>"#)
    try #expect(renderHTML(Div {}.ring(.white.opacity(0.5))) == #"<div class="ring-1 ring-white/50"></div>"#)
  }

  @Test func widths() throws {
    try #expect(renderHTML(Div {}.ring(width: 0)) == #"<div class="ring-0"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 1)) == #"<div class="ring-1"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 2)) == #"<div class="ring-2"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 3)) == #"<div class="ring"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 4)) == #"<div class="ring-4"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 5)) == #"<div class="ring-4"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 6)) == #"<div class="ring-4"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 7)) == #"<div class="ring-8"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 8)) == #"<div class="ring-8"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 9)) == #"<div class="ring-8"></div>"#)
    try #expect(renderHTML(Div {}.ring(width: 100)) == #"<div class="ring-8"></div>"#)
  }
}
