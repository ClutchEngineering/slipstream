import Testing

import Slipstream

struct ListTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(List {}) == "<ul></ul>")
    try #expect(renderHTML(List(ordered: true) {}) == "<ol></ol>")
  }

  @Test func withItems() throws {
    try #expect(renderHTML(List {
      ListItem {
        DOMString("Item 1")
      }
      ListItem {
        DOMString("Item 2")
      }
    }) == """
<ul>
 <li>Item 1</li>
 <li>Item 2</li>
</ul>
""")
    try #expect(renderHTML(List(ordered: true) {
      ListItem {
        DOMString("Item 1")
      }
      ListItem {
        DOMString("Item 2")
      }
    }) == """
<ol>
 <li>Item 1</li>
 <li>Item 2</li>
</ol>
""")
  }
}
