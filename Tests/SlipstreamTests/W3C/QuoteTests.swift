import Foundation
import Testing
import Slipstream

struct QuoteTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Quote {}) == "<q></q>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Quote {
      DOMString("Hello, world!")
    }) == """
<q>Hello, world!</q>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(Quote("Whatever you are, be a good one.")) == "<q>Whatever you are, be a good one.</q>")
  }

  @Test func withCite() throws {
    try #expect(
      renderHTML(
        Quote("The only way to do great work is to love what you do.", cite: URL(string: "https://example.com/quotes"))
      ) == #"<q cite="https://example.com/quotes">The only way to do great work is to love what you do.</q>"#
    )
  }

  @Test func withNilCite() throws {
    try #expect(
      renderHTML(
        Quote("Hello", cite: nil)
      ) == "<q>Hello</q>"
    )
  }

  @Test func withComplexContent() throws {
    try #expect(renderHTML(Quote {
      Bold("Important")
      DOMString(" message")
    }) == """
<q><b>Important</b> message</q>
""")
  }
}
