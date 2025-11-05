import Testing

import Slipstream

struct SearchTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Search {}) == "<search></search>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Search {
      DOMString("Search results")
    }) == """
<search>
 Search results
</search>
""")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Search {
      Form {
        TextField("query", placeholder: "Search...")
      }
    }) == """
<search>
 <form>
  <input name="query" placeholder="Search..." type="text" />
 </form>
</search>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Search {}.language("en")) == #"<search lang="en"></search>"#)
  }
}
