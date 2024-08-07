import Testing

import Slipstream

private struct PathEnvironmentKey: EnvironmentKey {
  static let defaultValue: String = "/"
}

extension EnvironmentValues {
  var path: String {
    get { self[PathEnvironmentKey.self] }
    set { self[PathEnvironmentKey.self] = newValue }
  }
}

private struct InjectorView: View {
  let path: String
  var body: some View {
    ConsumerView()
      .environment(\.path, path)
  }
}

private struct DefaultsView: View {
  var body: some View {
    ConsumerView()
  }
}

private struct ConsumerView: View {
  @Environment(\.path) var path

  var body: some View {
    DOMString(path)
  }
}

struct EnvironmentTests {
  @Test func rendersProvidedString() throws {
    try #expect(renderHTML(InjectorView(path: "Hello, world!")) == "Hello, world!")
    try #expect(renderHTML(InjectorView(path: "Slipstream")) == "Slipstream")
    try #expect(renderHTML(DefaultsView()) == "/")
  }
}
