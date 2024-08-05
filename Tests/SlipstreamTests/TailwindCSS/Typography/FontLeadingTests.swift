import Testing
import Slipstream

struct FontLeadingTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.fontLeading(.none)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(.tight)) == #"<div class="leading-tight"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(.snug)) == #"<div class="leading-snug"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(.normal)) == #"<div class="leading-normal"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(.relaxed)) == #"<div class="leading-relaxed"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(.loose)) == #"<div class="leading-loose"></div>"#)
  }

  @Test func specific() throws {
    try #expect(renderHTML(Div {}.fontLeading(0)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(1)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(2)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(3)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(4)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(5)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(6)) == #"<div class="leading-none"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(7)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(10)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(11)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(12)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(13)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(14)) == #"<div class="leading-3"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(15)) == #"<div class="leading-4"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(16)) == #"<div class="leading-4"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(17)) == #"<div class="leading-4"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(18)) == #"<div class="leading-4"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(19)) == #"<div class="leading-5"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(20)) == #"<div class="leading-5"></div>"#)
    try #expect(renderHTML(Div {}.fontLeading(100)) == #"<div class="leading-10"></div>"#)
  }
}
