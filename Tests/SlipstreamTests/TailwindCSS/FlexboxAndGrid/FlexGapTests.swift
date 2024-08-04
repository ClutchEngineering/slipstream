import Testing
import Slipstream

struct FlexGapTests {
  @Test func axis() throws {
    try #expect(renderHTML(Div {}.flexGap(.x, width: 2)) == #"<div class="gap-x-0.5"></div>"#)
    try #expect(renderHTML(Div {}.flexGap(.y, width: 2)) == #"<div class="gap-y-0.5"></div>"#)
  }
}
