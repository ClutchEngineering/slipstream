import Testing
import Slipstream

struct FontDesignTests {
  @Test func enumerations() throws {
    try #expect(renderHTML(Div {}.fontDesign(.sans)) == #"<div class="font-sans"></div>"#)
    try #expect(renderHTML(Div {}.fontDesign(.serif)) == #"<div class="font-serif"></div>"#)
    try #expect(renderHTML(Div {}.fontDesign(.monospaced)) == #"<div class="font-mono"></div>"#)
  }

  @Test func custom() throws {
    try #expect(renderHTML(Div {}.fontDesign("rounded")) == #"<div class="font-rounded"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(Div {}.fontDesign(.sans, condition: .active)) == #"<div class="active:font-sans"></div>"#
    )
  }
}
