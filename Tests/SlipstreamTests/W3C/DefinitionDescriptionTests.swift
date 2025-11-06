import Foundation
import Testing

import Slipstream

struct DefinitionDescriptionTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DefinitionDescription {}) == "<dd></dd>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(DefinitionDescription("A markup language")) == """
<dd>
 A markup language
</dd>
""")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(DefinitionDescription {
      Emphasis("Hypertext")
      DOMString(" Markup Language")
    }) == """
<dd>
 <em>Hypertext</em> Markup Language
</dd>
""")
  }
}
