import Testing

import Slipstream

private struct SingleBlockView: View {
  var body: some View {
    DOMString("Hello, world!")
  }
}

private struct TupleBlockView: View {
  var body: some View {
    DOMString("Hello, ")
    DOMString("world!")
  }
}

private struct IfElseBlockView: View {
  let bool: Bool
  var body: some View {
    if bool {
      DOMString("true")
    } else {
      DOMString("false")
    }
  }
}

private struct IfBlockView: View {
  let bool: Bool
  var body: some View {
    if bool {
      DOMString("true")
    }
  }
}

private struct ArrayBlockView: View {
  var body: some View {
    for i in 1...3 {
      DOMString("\(i)")
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

  @Test func ifElseBlock() throws {
    try #expect(renderHTML(IfElseBlockView(bool: true)) == "true")
    try #expect(renderHTML(IfElseBlockView(bool: false)) == "false")
  }

  @Test func ifBlock() throws {
    try #expect(renderHTML(IfBlockView(bool: true)) == "true")
    try #expect(renderHTML(IfBlockView(bool: false)) == "")
  }

  @Test func arrayBlock() throws {
    try #expect(renderHTML(ArrayBlockView()) == "123")
  }
}
