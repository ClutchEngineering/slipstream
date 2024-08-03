import Testing

import Slipstream

struct TitleTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Title("")) == "<title></title>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Title("Hello, world!")) == "<title>Hello, world!</title>")
  }
}
