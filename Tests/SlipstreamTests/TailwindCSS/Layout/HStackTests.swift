import Testing

import Slipstream

struct HStackTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(HStack {}) == #"<div class="flex flex-row items-center"></div>"#)
    try #expect(renderHTML(HStack(reversed: true) {}) == #"<div class="flex flex-row-reverse items-center"></div>"#)
  }

  @Test func alignment() throws {
    try #expect(renderHTML(HStack(alignment: .stretch) {}) == #"<div class="flex flex-row items-stretch"></div>"#)
    try #expect(renderHTML(HStack(alignment: .start) {}) == #"<div class="flex flex-row items-start"></div>"#)
    try #expect(renderHTML(HStack(alignment: .center) {}) == #"<div class="flex flex-row items-center"></div>"#)
    try #expect(renderHTML(HStack(alignment: .end) {}) == #"<div class="flex flex-row items-end"></div>"#)
    try #expect(renderHTML(HStack(alignment: .baseline) {}) == #"<div class="flex flex-row items-baseline"></div>"#)
    try #expect(renderHTML(HStack(alignment: .top) {}) == #"<div class="flex flex-row items-start"></div>"#)
    try #expect(renderHTML(HStack(alignment: .bottom) {}) == #"<div class="flex flex-row items-end"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(HStack {
      DOMString("Hello, world!")
    }) == """
<div class="flex flex-row items-center">
 Hello, world!
</div>
""")
  }
}
