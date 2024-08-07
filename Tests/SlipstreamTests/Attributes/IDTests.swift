import Testing

import Slipstream

private struct IDView: View {
  var body: some View {
    HTML {
      DOMString("Bonjour!")
    }
    .id("root")
  }
}

struct IDTests {
  @Test func attributeIsModified() throws {
    try #expect(renderHTML(IDView()) == """
<html id="root">
 Bonjour!
</html>
""")
  }
}
