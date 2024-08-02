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

private struct ConditionalBlockView: View {
  let bool: Bool
  var body: some View {
    if bool {
      Text("true")
    } else {
      Text("false")
    }
  }
}

struct ViewBuilderTests {
  @Test func singleBlock() throws {
    try #expect(renderHTML(SingleBlockView()) == "Hello, world!")
  }

  @Test func tupleBlock() throws {
    try #expect(renderHTML(TupleBlockView()) == "Hello, world!")
  }

  @Test func conditionalBlock() throws {
    try #expect(renderHTML(ConditionalBlockView(bool: true)) == "true")
    try #expect(renderHTML(ConditionalBlockView(bool: false)) == "false")
  }
}
