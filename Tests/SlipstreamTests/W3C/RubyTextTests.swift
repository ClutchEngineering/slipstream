import Testing
import Slipstream

struct RubyTextTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(RubyText {}) == "<rt></rt>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(RubyText {
      DOMString("pronunciation")
    }) == """
<rt>pronunciation</rt>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(RubyText("とうきょう")) == "<rt>とうきょう</rt>")
  }

  @Test func withComplexContent() throws {
    try #expect(renderHTML(RubyText {
      Emphasis("stressed")
    }) == """
<rt><em>stressed</em></rt>
""")
  }
}
