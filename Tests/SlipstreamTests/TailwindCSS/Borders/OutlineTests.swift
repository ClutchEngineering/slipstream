import Testing
import Slipstream

struct OutlineTests {
  @Test func colors() throws {
    try #expect(renderHTML(Div {}.outline(.black)) == #"<div class="outline-1 outline-black"></div>"#)
    try #expect(renderHTML(Div {}.outline(.white.opacity(0.5))) == #"<div class="outline-1 outline-white/50"></div>"#)
  }

  @Test func widths() throws {
    try #expect(renderHTML(Div {}.outline(width: 0)) == #"<div class="outline-0"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 1)) == #"<div class="outline-1"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 2)) == #"<div class="outline-2"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 3)) == #"<div class="outline-2"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 4)) == #"<div class="outline-4"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 5)) == #"<div class="outline-4"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 6)) == #"<div class="outline-4"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 7)) == #"<div class="outline-8"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 8)) == #"<div class="outline-8"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 9)) == #"<div class="outline-8"></div>"#)
    try #expect(renderHTML(Div {}.outline(width: 100)) == #"<div class="outline-8"></div>"#)
  }

  @Test func styles() throws {
    try #expect(renderHTML(Div {}.outline(style: .none)) == #"<div class="outline-none"></div>"#)
    try #expect(renderHTML(Div {}.outline(style: .solid)) == #"<div class="outline outline-1"></div>"#)
    try #expect(renderHTML(Div {}.outline(style: .dashed)) == #"<div class="outline-1 outline-dashed"></div>"#)
    try #expect(renderHTML(Div {}.outline(style: .dotted)) == #"<div class="outline-1 outline-dotted"></div>"#)
    try #expect(renderHTML(Div {}.outline(style: .double)) == #"<div class="outline-1 outline-double"></div>"#)
  }
}
