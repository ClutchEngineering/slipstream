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

private struct SingleConditionBlockView: View {
  let bool: Bool
  var body: some View {
    if bool {
      Text("true")
    }
  }
}

private struct ArrayBlockView: View {
  var body: some View {
    for i in 1...3 {
      Text("\(i)")
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

  @Test func singleConditionBlock() throws {
    try #expect(renderHTML(SingleConditionBlockView(bool: true)) == "true")
    try #expect(renderHTML(SingleConditionBlockView(bool: false)) == "")
  }

  @Test func arrayBlock() throws {
    try #expect(renderHTML(ArrayBlockView()) == "123")
  }
}
