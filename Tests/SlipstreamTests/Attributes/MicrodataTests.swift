import Testing

import Slipstream

struct MicrodataTests {
  @Test func itemScope() throws {
    try #expect(renderHTML(Div {}.itemScope()) == #"<div itemscope=""></div>"#)
  }

  @Test func itemScopeExplicitTrue() throws {
    try #expect(renderHTML(Div {}.itemScope(true)) == #"<div itemscope=""></div>"#)
  }

  @Test func itemScopeFalse() throws {
    try #expect(renderHTML(Div {}.itemScope(false)) == #"<div></div>"#)
  }

  @Test func itemType() throws {
    try #expect(renderHTML(Div {}.itemType("https://schema.org/Person")) == #"<div itemtype="https://schema.org/Person"></div>"#)
  }

  @Test func itemID() throws {
    try #expect(renderHTML(Div {}.itemID("urn:isbn:978-0-596-52068-7")) == #"<div itemid="urn:isbn:978-0-596-52068-7"></div>"#)
  }

  @Test func itemProp() throws {
    try #expect(renderHTML(Span {
      DOMString("John Doe")
    }.itemProp("name")) == """
<span itemprop="name">
 John Doe
</span>
""")
  }

  @Test func itemRef() throws {
    try #expect(renderHTML(Div {}.itemRef("prop1 prop2")) == #"<div itemref="prop1 prop2"></div>"#)
  }

  @Test func combinedMicrodata() throws {
    try #expect(renderHTML(Div {
      Span {
        DOMString("John Doe")
      }
      .itemProp("name")
    }
    .itemScope()
    .itemType("https://schema.org/Person")) == """
<div itemscope="" itemtype="https://schema.org/Person">
 <span itemprop="name">
  John Doe
 </span>
</div>
""")
  }
}
