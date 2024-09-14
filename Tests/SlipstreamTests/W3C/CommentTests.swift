import Testing

import Slipstream

struct CommentTests {
  @Test func renders() throws {
    try #expect(renderHTML(Comment("Some comment")) == "<!-- Some comment -->")
  }
}
