import Testing

import Slipstream

struct ArticleTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Article {}) == "<article></article>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Article {
      DOMString("Hello, world!")
    }) == """
<article>
 Hello, world!
</article>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Article {}.language("en")) == #"<article lang="en"></article>"#)
  }
}
