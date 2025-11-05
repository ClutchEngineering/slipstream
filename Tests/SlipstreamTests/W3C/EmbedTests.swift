import Foundation
import Testing

import Slipstream

struct EmbedTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Embed(nil)) == "")
  }

  @Test func url() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/animation.swf"))) == #"<embed src="/media/animation.swf" />"#)
  }

  @Test func urlWithType() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/video.mp4"), type: "video/mp4")) == #"<embed src="/media/video.mp4" type="video/mp4" />"#)
  }
}
