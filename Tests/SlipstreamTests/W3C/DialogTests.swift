import Foundation
import Testing

import Slipstream

struct DialogTests {
  @Test func empty() throws {
    try #expect(renderHTML(Dialog {}) == "<dialog></dialog>")
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Dialog {
      DOMString("Dialog content")
    }) == """
<dialog>
 Dialog content
</dialog>
""")
  }

  @Test func openFalse() throws {
    try #expect(renderHTML(Dialog(open: false) {
      DOMString("Dialog content")
    }) == """
<dialog>
 Dialog content
</dialog>
""")
  }

  @Test func openTrue() throws {
    try #expect(renderHTML(Dialog(open: true) {
      DOMString("Dialog content")
    }) == """
<dialog open>
 Dialog content
</dialog>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Dialog(open: true) {
      DOMString("Dialog content")
    }.language("en")) == """
<dialog open lang="en">
 Dialog content
</dialog>
""")
  }
}
