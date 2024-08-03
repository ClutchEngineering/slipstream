import Testing

import Slipstream

private struct ClassView: View {
  var body: some View {
    HTML {
      Text("Bonjour!")
        .classNames(["many", "classes"])
    }
    .className("root")
  }
}

struct ClassTests {
  @Test func attributeIsModified() throws {
    try #expect(renderHTML(ClassView()) == """
<html class="root">
 Bonjour!
</html>
""")
  }
}
