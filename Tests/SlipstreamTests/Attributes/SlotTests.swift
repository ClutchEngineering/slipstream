import Testing

import Slipstream

struct SlotAttributeTests {
  @Test func withSlotName() throws {
    try #expect(renderHTML(Span {}.slot("header")) == #"<span slot="header"></span>"#)
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Span {
      DOMString("Header content")
    }.slot("header")) == """
<span slot="header">
 Header content
</span>
""")
  }
}
