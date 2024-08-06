import Testing
import Slipstream

struct FontStyleTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.fontStyle(.italic)) == #"<div class="italic"></div>"#)
    try #expect(renderHTML(Div {}.fontStyle(.notItalic)) == #"<div class="not-italic"></div>"#)
  }

  @Test func italic() throws {
    try #expect(renderHTML(Div {}.italic()) == #"<div class="italic"></div>"#)
    try #expect(renderHTML(Div {}.italic(isActive: false)) == #"<div class="not-italic"></div>"#)
  }
}
