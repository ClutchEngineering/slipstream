import Testing
import Slipstream

struct RubyParenthesisTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(RubyParenthesis {}) == "<rp></rp>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(RubyParenthesis {
      DOMString("(")
    }) == """
<rp>(</rp>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(RubyParenthesis(")")) == "<rp>)</rp>")
  }

  @Test func openingParenthesis() throws {
    try #expect(renderHTML(RubyParenthesis("(")) == "<rp>(</rp>")
  }

  @Test func closingParenthesis() throws {
    try #expect(renderHTML(RubyParenthesis(")")) == "<rp>)</rp>")
  }
}
