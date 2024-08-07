import Testing

import Slipstream

private struct StateView: View {
  let string: String
  var body: some View {
    DOMString(string)
  }
}

struct StateTests {
  @Test func rendersProvidedString() throws {
    try #expect(renderHTML(StateView(string: "Hello, world!")) == "Hello, world!")
    try #expect(renderHTML(StateView(string: "Slipstream")) == "Slipstream")
  }
}
