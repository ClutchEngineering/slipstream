import Foundation
import Testing

import Slipstream

struct IFrameTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(IFrame(nil)) == "")
  }

  @Test func url() throws {
    try #expect(renderHTML(IFrame(URL(string: "/main.html"))) == #"<iframe src="/main.html"></iframe>"#)
  }
}
