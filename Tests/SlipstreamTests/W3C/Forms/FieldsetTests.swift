import Testing

import Slipstream

struct FieldsetTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Fieldset {}) == "<fieldset></fieldset>")
  }

  @Test func withLegend() throws {
    try #expect(renderHTML(Fieldset {
      Legend("Personal Information")
    }) == """
<fieldset>
 <legend>
  Personal Information
 </legend>
</fieldset>
""")
  }

  @Test func withFormControls() throws {
    try #expect(renderHTML(Fieldset {
      Legend("Shipping Address")
      TextField("Street", type: .text)
      TextField("City", type: .text)
    }) == """
<fieldset>
 <legend>
  Shipping Address
 </legend>
 <input type="text" placeholder="Street" />
 <input type="text" placeholder="City" />
</fieldset>
""")
  }

  @Test func disabled() throws {
    try #expect(renderHTML(Fieldset {
      Legend("Disabled Section")
    }.disabled()) == """
<fieldset disabled>
 <legend>
  Disabled Section
 </legend>
</fieldset>
""")
  }

  @Test func withName() throws {
    try #expect(renderHTML(Fieldset(name: "shipping") {
      Legend("Shipping")
    }) == """
<fieldset name="shipping">
 <legend>
  Shipping
 </legend>
</fieldset>
""")
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(Fieldset(name: "payment") {
      Legend("Payment Method")
    }.disabled()) == """
<fieldset disabled name="payment">
 <legend>
  Payment Method
 </legend>
</fieldset>
""")
  }

  @Test func nestedFieldsets() throws {
    try #expect(renderHTML(Fieldset {
      Legend("Customer Information")
      Fieldset {
        Legend("Personal Details")
        TextField("Name", type: .text)
      }
      Fieldset {
        Legend("Contact Details")
        TextField("Email", type: .email)
      }
    }) == """
<fieldset>
 <legend>
  Customer Information
 </legend>
 <fieldset>
  <legend>
   Personal Details
  </legend>
  <input type="text" placeholder="Name" />
 </fieldset>
 <fieldset>
  <legend>
   Contact Details
  </legend>
  <input type="email" placeholder="Email" />
 </fieldset>
</fieldset>
""")
  }

  @Test func attribute() throws {
    try #expect(renderHTML(Fieldset {}.language("en")) == #"<fieldset lang="en"></fieldset>"#)
  }
}
