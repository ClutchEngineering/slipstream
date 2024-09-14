import Testing
import Slipstream

struct TransitionTests {
  @Test func properties() throws {
    try #expect(renderHTML(Div {}.transition(.none)) == #"<div class="transition-none"></div>"#)
    try #expect(renderHTML(Div {}.transition(.all)) == #"<div class="transition-all"></div>"#)
    try #expect(renderHTML(Div {}.transition(.default)) == #"<div class="transition"></div>"#)
    try #expect(renderHTML(Div {}.transition(.colors)) == #"<div class="transition-colors"></div>"#)
    try #expect(renderHTML(Div {}.transition(.opacity)) == #"<div class="transition-opacity"></div>"#)
    try #expect(renderHTML(Div {}.transition(.shadow)) == #"<div class="transition-shadow"></div>"#)
    try #expect(renderHTML(Div {}.transition(.transform)) == #"<div class="transition-transform"></div>"#)
  }
}
