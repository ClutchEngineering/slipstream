import Testing

import Slipstream

struct LinebreakTests {
  @Test func render() throws {
    try #expect(renderHTML(Linebreak()) == "<br />")
  }
}
