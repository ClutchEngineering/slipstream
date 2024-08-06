import Testing

import Slipstream

struct DividerTests {
  @Test func divider() throws {
    try #expect(renderHTML(Divider()) == "<hr />")
  }
}
