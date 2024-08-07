import Testing

import Slipstream

struct HeadTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Head {}) == "<head></head>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(HTML {
      Head {
        DOMString("Hello, world!")
      }
    }) == """
<html>
 <head>
  Hello, world!
 </head>
</html>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Head {}.language("en")) == #"<head lang="en"></head>"#)
  }
}
