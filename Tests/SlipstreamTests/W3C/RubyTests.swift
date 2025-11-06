import Testing
import Slipstream

struct RubyTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Ruby {}) == "<ruby></ruby>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Ruby {
      DOMString("漢字")
    }) == """
<ruby>漢字</ruby>
""")
  }

  @Test func withRubyText() throws {
    try #expect(renderHTML(Ruby {
      DOMString("東京")
      RubyText("とうきょう")
    }) == """
<ruby>東京<rt>とうきょう</rt></ruby>
""")
  }

  @Test func withRubyParentheses() throws {
    try #expect(renderHTML(Ruby {
      DOMString("明日")
      RubyParenthesis("(")
      RubyText("Ashita")
      RubyParenthesis(")")
    }) == """
<ruby>明日<rp>(</rp><rt>Ashita</rt><rp>)</rp></ruby>
""")
  }

  @Test func complexRubyAnnotation() throws {
    try #expect(renderHTML(Ruby {
      DOMString("漢")
      RubyParenthesis("(")
      RubyText("kan")
      RubyParenthesis(")")
      DOMString("字")
      RubyParenthesis("(")
      RubyText("ji")
      RubyParenthesis(")")
    }) == """
<ruby>漢<rp>(</rp><rt>kan</rt><rp>)</rp>字<rp>(</rp><rt>ji</rt><rp>)</rp></ruby>
""")
  }
}
