import Testing

import Slipstream

struct AddressTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Address {}) == "<address></address>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Address {
      DOMString("Contact us at: info@example.com")
    }) == """
<address>
 Contact us at: info@example.com
</address>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(Address("support@example.com")) == "<address>support@example.com</address>")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Address {}.language("en")) == #"<address lang="en"></address>"#)
  }
}
