import Foundation
import Testing
import Slipstream

struct ExpectTests {
  @Test func nilHref() throws {
    try #expect(renderHTML(Expect(nil)) == "")
  }

  @Test func validHref() throws {
    try #expect(renderHTML(Expect("#main-content")) == #"<link rel="expect" href="\#main-content" />"#)
  }
}
