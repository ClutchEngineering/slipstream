import Testing

import Slipstream

struct LegendTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Legend {}) == "<legend></legend>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Legend {
      DOMString("Personal Information")
    }) == "<legend>Personal Information</legend>")
  }

  @Test func withStringLiteral() throws {
    try #expect(renderHTML(Legend("Shipping Address")) == "<legend>Shipping Address</legend>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Legend {}.language("en")) == #"<legend lang="en"></legend>"#)
  }
}
