import Testing
import Slipstream

struct OffsetTests {
  @Test func singleValue() throws {
    try #expect(renderHTML(Div {}.offset(x: 32)) == #"<div class="translate-x-8"></div>"#)
    try #expect(renderHTML(Div {}.offset(y: 16)) == #"<div class="translate-y-4"></div>"#)
  }

  @Test func bothValues() throws {
    try #expect(renderHTML(Div {}.offset(x: 4, y: 8)) == #"<div class="translate-x-1 translate-y-2"></div>"#)
  }

  @Test func negativeValues() throws {
    try #expect(renderHTML(Div {}.offset(x: -4, y: -8)) == #"<div class="-translate-x-1 -translate-y-2"></div>"#)
  }
}
