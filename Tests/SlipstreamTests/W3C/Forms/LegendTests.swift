import Testing

import Slipstream

struct LegendTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Legend {}) == "<legend></legend>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Legend {
      DOMString("Personal Information")
    }) == """
<legend>
 Personal Information
</legend>
""")
  }

  @Test func withTextConvenienceInitializer() throws {
    try #expect(renderHTML(Legend("Account Settings")) == #"<legend>Account Settings</legend>"#)
  }

  @Test func complexContent() throws {
    try #expect(renderHTML(Legend {
      DOMString("Contact ")
      DOMString("Information")
    }) == #"<legend>Contact Information</legend>"#)
  }

  @Test func withModifier() throws {
    try #expect(renderHTML(Legend("Shipping Address").modifier(AttributeModifier("id", value: "shipping-legend"))) == #"<legend id="shipping-legend">Shipping Address</legend>"#)
  }
}
