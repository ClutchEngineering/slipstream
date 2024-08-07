import Testing

import Slipstream

struct BodyTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Body {}) == "<body></body>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(HTML {
      Head {
      }
      Body {
        DOMString("Hello, world!")
      }
    }) == """
<html>
 <head></head>
 <body>
  Hello, world!
 </body>
</html>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Body {}.language("en")) == #"<body lang="en"></body>"#)
  }
}
