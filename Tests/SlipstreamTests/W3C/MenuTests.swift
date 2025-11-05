import Foundation
import Testing

import Slipstream

struct MenuTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Menu {}) == "<menu></menu>")
  }

  @Test func withItems() throws {
    try #expect(renderHTML(Menu {
      ListItem {
        DOMString("New")
      }
      ListItem {
        DOMString("Open")
      }
      ListItem {
        DOMString("Save")
      }
    }) == """
<menu>
 <li>New</li>
 <li>Open</li>
 <li>Save</li>
</menu>
""")
  }

  @Test func withLinks() throws {
    try #expect(renderHTML(Menu {
      ListItem {
        Link("New File", destination: URL(string: "/new"))
      }
      ListItem {
        Link("Open File", destination: URL(string: "/open"))
      }
    }) == """
<menu>
 <li><a href="/new">New File</a></li>
 <li><a href="/open">Open File</a></li>
</menu>
""")
  }

  @Test func withDivContent() throws {
    try #expect(renderHTML(Menu {
      Div {
        DOMString("File Operations")
      }
      Div {
        DOMString("Edit Operations")
      }
    }) == """
<menu>
 <div>File Operations</div>
 <div>Edit Operations</div>
</menu>
""")
  }

  @Test func nestedMenus() throws {
    try #expect(renderHTML(Menu {
      ListItem {
        DOMString("File")
      }
      Menu {
        ListItem {
          DOMString("New")
        }
        ListItem {
          DOMString("Open")
        }
      }
    }) == """
<menu>
 <li>File</li>
 <menu>
  <li>New</li>
  <li>Open</li>
 </menu>
</menu>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Menu {}.language("en")) == #"<menu lang="en"></menu>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(renderHTML(Menu {}.id("toolbar-menu").language("en")) == #"<menu id="toolbar-menu" lang="en"></menu>"#)
  }
}
