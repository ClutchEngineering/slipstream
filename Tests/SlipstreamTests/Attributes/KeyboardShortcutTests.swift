import Testing

import Slipstream

struct KeyboardShortcutTests {
  @Test func withSingleKey() throws {
    try #expect(renderHTML(Div {}.keyboardShortcut("s")) == #"<div accesskey="s"></div>"#)
  }

  @Test func onButton() throws {
    try #expect(renderHTML(Button {
      DOMString("Save")
    }.keyboardShortcut("s")) == """
<button accesskey="s">
 Save
</button>
""")
  }
}
