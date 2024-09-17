import Foundation
import Testing

import Slipstream

struct RedirectTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Redirect(nil)) == "")
  }

  @Test func withDelay() throws {
    try #expect(renderHTML(Redirect(URL(string: "/home.html"), delay: 1)) == #"<meta http-equiv="refresh" content="1.0; url='/home.html'" />"#)
  }
}
