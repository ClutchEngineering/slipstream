import Foundation
import Testing

import Slipstream

struct SlotTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Slot {}) == "<slot></slot>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Slot("Default content")) == """
<slot>
 Default content
</slot>
""")
  }

  @Test func withName() throws {
    try #expect(renderHTML(Slot(name: "header") {
      DOMString("Default header")
    }) == """
<slot name="header">
 Default header
</slot>
""")
  }

  @Test func withTextAndName() throws {
    try #expect(renderHTML(Slot("Default footer", name: "footer")) == """
<slot name="footer">
 Default footer
</slot>
""")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Slot(name: "content") {
      H2("Default Title")
      Paragraph("Default paragraph")
    }) == """
<slot name="content">
 <h2>Default Title</h2>
 <p>Default paragraph</p>
</slot>
""")
  }
}
