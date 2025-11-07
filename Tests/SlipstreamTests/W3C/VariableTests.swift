import Testing

import Slipstream

struct VariableTests {
  @Test func emptyVariable() throws {
    try #expect(renderHTML(Variable {}) == "<var></var>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Variable("x")) == "<var>x</var>")
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Variable {
      DOMString("variable")
    }) == "<var>variable</var>")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Variable("y").language("en")) == #"<var lang="en">y</var>"#)
  }
}
