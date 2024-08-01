import Testing

import Slipstream

private struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

struct HelloWorldTests {
  @Test func rendersExpectedResult() throws {
    try #expect(renderHTML(HelloWorld()) == "Hello, world!")
  }
}
