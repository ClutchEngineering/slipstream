import Testing

import Slipstream

struct DataListTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(DataList {}) == "<datalist></datalist>")
  }

  @Test func withId() throws {
    try #expect(renderHTML(DataList {}.id("browsers")) == #"<datalist id="browsers"></datalist>"#)
  }

  @Test func withOptions() throws {
    try #expect(renderHTML(DataList {
      Option("Chrome")
      Option("Firefox")
      Option("Safari")
    }) == "<datalist><option>Chrome</option><option>Firefox</option><option>Safari</option></datalist>")
  }

  @Test func withIdAndOptions() throws {
    try #expect(renderHTML(DataList {
      Option("Chrome")
      Option("Firefox")
      Option("Safari")
    }.id("browsers")) == #"<datalist id="browsers"><option>Chrome</option><option>Firefox</option><option>Safari</option></datalist>"#)
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(DataList {}.id("test").language("en")) == #"<datalist id="test" lang="en"></datalist>"#)
  }
}
