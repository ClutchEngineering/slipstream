import Testing

import Slipstream

struct VStackTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(VStack {}) == #"<div class="flex flex-col items-start"></div>"#)
    try #expect(renderHTML(VStack(reversed: true) {}) == #"<div class="flex flex-col-reverse items-start"></div>"#)
  }

  @Test func alignment() throws {
    try #expect(renderHTML(VStack(alignment: .stretch) {}) == #"<div class="flex flex-col items-stretch"></div>"#)
    try #expect(renderHTML(VStack(alignment: .start) {}) == #"<div class="flex flex-col items-start"></div>"#)
    try #expect(renderHTML(VStack(alignment: .center) {}) == #"<div class="flex flex-col items-center"></div>"#)
    try #expect(renderHTML(VStack(alignment: .end) {}) == #"<div class="flex flex-col items-end"></div>"#)
    try #expect(renderHTML(VStack(alignment: .baseline) {}) == #"<div class="flex flex-col items-baseline"></div>"#)
    try #expect(renderHTML(VStack(alignment: .leading) {}) == #"<div class="flex flex-col items-start"></div>"#)
    try #expect(renderHTML(VStack(alignment: .trailing) {}) == #"<div class="flex flex-col items-end"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(VStack {
      Text("Hello, world!")
    }) == """
<div class="flex flex-col items-start">
 Hello, world!
</div>
""")
  }
}
