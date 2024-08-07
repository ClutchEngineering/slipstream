import Testing

import Slipstream

struct PreformattedTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Preformatted {}) == "<pre></pre>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Preformatted {
      Text("Hello, world!")
    }) == """
<pre>Hello, world!</pre>
""")
  }
}
