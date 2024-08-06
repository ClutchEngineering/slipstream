import Testing

import Slipstream

struct HStackTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(HStack {}) == #"<div class="flex flex-row items-center"></div>"#)
    try #expect(renderHTML(HStack(reversed: true) {}) == #"<div class="flex flex-row-reverse items-center"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(HStack {
      Text("Hello, world!")
    }) == """
<div class="flex flex-row items-center">
 Hello, world!
</div>
""")
  }
}
