import Foundation
import Testing

import Slipstream

struct OptGroupTests {
  @Test func basicOptGroup() throws {
    try #expect(renderHTML(OptGroup("Group Label") {
      Option("Option 1", value: "1")
      Option("Option 2", value: "2")
    }) == """
<optgroup label="Group Label">
 <option value="1">Option 1</option>
 <option value="2">Option 2</option>
</optgroup>
""")
  }

  @Test func disabledOptGroup() throws {
    try #expect(renderHTML(OptGroup("Group Label", disabled: true) {
      Option("Option 1", value: "1")
      Option("Option 2", value: "2")
    }) == """
<optgroup label="Group Label" disabled>
 <option value="1">Option 1</option>
 <option value="2">Option 2</option>
</optgroup>
""")
  }

  @Test func emptyOptGroup() throws {
    try #expect(renderHTML(OptGroup("Empty Group") {}) == #"<optgroup label="Empty Group"></optgroup>"#)
  }

  @Test func inPicker() throws {
    try #expect(renderHTML(Picker {
      OptGroup("Fruits") {
        Option("Apple", value: "apple")
        Option("Banana", value: "banana")
      }
      OptGroup("Vegetables") {
        Option("Carrot", value: "carrot")
        Option("Lettuce", value: "lettuce")
      }
    }) == """
<select>
 <optgroup label="Fruits">
  <option value="apple">Apple</option>
  <option value="banana">Banana</option>
 </optgroup>
 <optgroup label="Vegetables">
  <option value="carrot">Carrot</option>
  <option value="lettuce">Lettuce</option>
 </optgroup>
</select>
""")
  }

  @Test func mixedOptionsAndGroups() throws {
    try #expect(renderHTML(Picker {
      Option("All", value: "all")
      OptGroup("Specific") {
        Option("Option 1", value: "1")
        Option("Option 2", value: "2")
      }
    }) == """
<select>
 <option value="all">All</option>
 <optgroup label="Specific">
  <option value="1">Option 1</option>
  <option value="2">Option 2</option>
 </optgroup>
</select>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(OptGroup("Group") {}.language("en")) == #"<optgroup label="Group" lang="en"></optgroup>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(renderHTML(OptGroup("Group") {}.id("my-group").language("en")) == #"<optgroup label="Group" id="my-group" lang="en"></optgroup>"#)
  }
}
