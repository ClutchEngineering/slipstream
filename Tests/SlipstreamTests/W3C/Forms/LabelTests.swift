import Testing

import Slipstream

struct LabelTests {
  @Test func basicWithText() throws {
    try #expect(renderHTML(Label("Click me")) == #"<label>Click me</label>"#)
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Label {
      DOMString("Submit")
    }) == #"<label>Submit</label>"#)
  }

  @Test func withHtmlFor() throws {
    try #expect(renderHTML(Label("Menu", htmlFor: "menu-toggle")) == #"<label for="menu-toggle">Menu</label>"#)
  }

  @Test func withContentAndHtmlFor() throws {
    try #expect(renderHTML(Label(htmlFor: "terms") {
      DOMString("I agree to the terms")
    }) == #"<label for="terms">I agree to the terms</label>"#)
  }

  @Test func fluentHtmlFor() throws {
    try #expect(renderHTML(Label("Agreement").htmlFor("terms")) == #"<label for="terms">Agreement</label>"#)
  }

  @Test func mobileMenuToggleUseCase() throws {
    // Test the specific use case for mobile menu toggle
    try #expect(renderHTML(Label("☰", htmlFor: "menu-toggle")) == #"<label for="menu-toggle">☰</label>"#)
  }

  @Test func complexContent() throws {
    try #expect(renderHTML(Label(htmlFor: "checkbox") {
      DOMString("Complex ")
      DOMString("label")
    }) == #"<label for="checkbox">Complex label</label>"#)
  }
}
