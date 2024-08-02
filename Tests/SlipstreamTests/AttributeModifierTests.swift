import Testing

import Slipstream

private struct ModifiedView: View {
  var body: some View {
    HTML {
    }
    .modifier(AttributeModifier(.lang, value: "en"))
  }
}

private struct ModifiedText: View {
  var body: some View {
    Text("Hello, world!")
      .modifier(AttributeModifier(.lang, value: "en"))
  }
}

struct AttributeModifierTests {
  @Test func elementAttributesAreModified() throws {
    try #expect(renderHTML(ModifiedView()) == #"<html lang="en"></html>"#)
  }

  @Test func textAttributesCantBeModified() throws {
    try #expect(renderHTML(ModifiedText()) == #"Hello, world!"#)
  }
}
