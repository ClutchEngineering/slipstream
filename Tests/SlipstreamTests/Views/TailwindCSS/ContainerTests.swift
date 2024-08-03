import Testing

import Slipstream

struct ContainerTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Container {}) == #"<div class="container"></div>"#)
  }

  @Test func withText() throws {
    try #expect(renderHTML(Container {
      Text("Hello, world!")
    }) == """
<div class="container">
 Hello, world!
</div>
""")
  }
}
