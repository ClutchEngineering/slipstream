import Testing

import Slipstream

private struct SingleBlockView: View {
  var body: some View {
    Text("Hello, world!")
  }
}

private struct TupleBlockView: View {
  var body: some View {
    Text("Hello, ")
    Text("world!")
  }
}

struct ViewBuilderTests {
  @Test func rendersExpectedResult() throws {
    try #expect(renderHTML(SingleBlockView()) == "Hello, world!")
    try #expect(renderHTML(TupleBlockView()) == "Hello, world!")
  }
}
