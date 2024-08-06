import Testing

import Slipstream

struct ResponsiveStackTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(ResponsiveStack {}) == #"<div class="flex flex-col md:flex-row"></div>"#)
    try #expect(renderHTML(ResponsiveStack(reversed: true) {}) == #"<div class="flex flex-col-reverse md:flex-row-reverse"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(ResponsiveStack {
      Text("Hello, world!")
    }) == """
<div class="flex flex-col md:flex-row">
 Hello, world!
</div>
""")
  }
}
