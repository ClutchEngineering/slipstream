import Testing

import Slipstream

struct DataListTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DataList {}) == "<datalist></datalist>")
  }

  @Test func withId() throws {
    try #expect(renderHTML(DataList(id: "browsers") {}) == #"<datalist id="browsers"></datalist>"#)
  }

  @Test func withOptions() throws {
    try #expect(renderHTML(DataList {
      Option("Chrome")
      Option("Firefox")
      Option("Safari")
    }) == """
<datalist>
 <option>Chrome</option>
 <option>Firefox</option>
 <option>Safari</option>
</datalist>
""")
  }

  @Test func withIdAndOptions() throws {
    try #expect(renderHTML(DataList(id: "browsers") {
      Option("Chrome")
      Option("Firefox")
      Option("Safari")
    }) == """
<datalist id="browsers">
 <option>Chrome</option>
 <option>Firefox</option>
 <option>Safari</option>
</datalist>
""")
  }

  @Test func inContext() throws {
    try #expect(renderHTML(Form {
      TextField(type: .text, name: "browser")
        .attribute("list", "browsers")
      DataList(id: "browsers") {
        Option("Chrome")
        Option("Firefox")
      }
    }) == """
<form>
 <input type="text" name="browser" list="browsers" />
 <datalist id="browsers">
  <option>Chrome</option>
  <option>Firefox</option>
 </datalist>
</form>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(DataList(id: "test") {}.language("en")) == #"<datalist id="test" lang="en"></datalist>"#)
  }
}
