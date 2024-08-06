import Testing
import Slipstream

struct ListStyleTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(ListItem {}.listStyle(.none)) == #"<li class="list-none"></li>"#)
    try #expect(renderHTML(ListItem {}.listStyle(.disc)) == #"<li class="list-disc"></li>"#)
    try #expect(renderHTML(ListItem {}.listStyle(.decimal)) == #"<li class="list-decimal"></li>"#)
  }
}
