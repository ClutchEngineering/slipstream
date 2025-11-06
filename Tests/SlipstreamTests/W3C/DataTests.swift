import Testing

import Slipstream

struct DataTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Data {}) == "<data></data>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Data("Product A")) == "<data>Product A</data>")
  }

  @Test func withTextAndValue() throws {
    try #expect(renderHTML(Data("Product A", value: "12345")) == #"<data value="12345">Product A</data>"#)
  }

  @Test func withViewBuilderContent() throws {
    try #expect(renderHTML(Data {
      DOMString("Item XYZ")
    }) == """
<data>Item XYZ</data>
""")
  }

  @Test func withViewBuilderContentAndValue() throws {
    try #expect(renderHTML(Data(value: "99999") {
      DOMString("Item XYZ")
    }) == """
<data value="99999">Item XYZ</data>
""")
  }

  @Test func inContext() throws {
    try #expect(renderHTML(Paragraph {
      DOMString("Product: ")
      Data("Widget", value: "W-001")
      DOMString(" is available.")
    }) == """
<p>Product: <data value="W-001">Widget</data> is available.</p>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Data("Test", value: "123").language("en")) == #"<data value="123" lang="en">Test</data>"#)
  }
}
