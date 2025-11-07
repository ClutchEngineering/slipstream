import Testing

import Slipstream

struct TooltipTests {
  @Test func withSimpleText() throws {
    try #expect(renderHTML(Div {}.tooltip("Click me")) == #"<div title="Click me"></div>"#)
  }

  @Test func onButton() throws {
    try #expect(renderHTML(Button {
      DOMString("Submit")
    }.tooltip("Submit the form")) == """
<button title="Submit the form">
 Submit
</button>
""")
  }
}
