import Testing

import Slipstream

struct VStackTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(VStack {}) == #"<div class="flex flex-col items-start"></div>"#)
    try #expect(renderHTML(VStack(reversed: true) {}) == #"<div class="flex flex-col-reverse items-start"></div>"#)
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
