import Testing
import Slipstream

struct TextDecorationTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.textDecoration(.underline)) == #"<div class="underline"></div>"#)
    try #expect(renderHTML(Div {}.textDecoration(.overline)) == #"<div class="overline"></div>"#)
    try #expect(renderHTML(Div {}.textDecoration(.lineThrough)) == #"<div class="line-through"></div>"#)
    try #expect(renderHTML(Div {}.textDecoration(.none)) == #"<div class="no-underline"></div>"#)

    try #expect(renderHTML(Div {}.textDecoration(.underline, color: .white)) == #"<div class="decoration-white underline"></div>"#)
  }

  @Test func underline() throws {
    try #expect(renderHTML(Div {}.underline()) == #"<div class="underline"></div>"#)

    try #expect(renderHTML(Div {}.underline(color: .black)) == #"<div class="decoration-black underline"></div>"#)
  }

  @Test func strikethrough() throws {
    try #expect(renderHTML(Div {}.strikethrough()) == #"<div class="line-through"></div>"#)

    try #expect(renderHTML(Div {}.strikethrough(color: .palette(.cyan, darkness: 500))) == #"<div class="decoration-cyan-500 line-through"></div>"#)
  }
}
