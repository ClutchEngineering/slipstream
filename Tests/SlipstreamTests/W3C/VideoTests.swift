import Foundation
import Testing

import Slipstream

struct VideoTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Video(nil)) == "<video></video>")
  }

  @Test func url() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4"))) == #"<video src="/video.mp4"></video>"#)
  }

  @Test func controls() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).controls()) == #"<video src="/video.mp4" controls=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).controls(true)) == #"<video src="/video.mp4" controls=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).controls(false)) == #"<video src="/video.mp4"></video>"#)
  }

  @Test func autoplay() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).autoplay()) == #"<video src="/video.mp4" autoplay=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).autoplay(true)) == #"<video src="/video.mp4" autoplay=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).autoplay(false)) == #"<video src="/video.mp4"></video>"#)
  }

  @Test func muted() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).muted()) == #"<video src="/video.mp4" muted=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).muted(true)) == #"<video src="/video.mp4" muted=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).muted(false)) == #"<video src="/video.mp4"></video>"#)
  }

  @Test func loop() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).loop()) == #"<video src="/video.mp4" loop=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).loop(true)) == #"<video src="/video.mp4" loop=""></video>"#)
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).loop(false)) == #"<video src="/video.mp4"></video>"#)
  }

  @Test func width() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).width(640)) == #"<video src="/video.mp4" width="640"></video>"#)
  }

  @Test func height() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).height(480)) == #"<video src="/video.mp4" height="480"></video>"#)
  }

  @Test func poster() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).poster(URL(string: "/poster.jpg"))) == #"<video src="/video.mp4" poster="/poster.jpg"></video>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(
      renderHTML(
        Video(URL(string: "/video.mp4"))
          .controls()
          .autoplay()
          .muted()
          .loop()
          .width(640)
          .height(480)
          .poster(URL(string: "/poster.jpg"))
      ) == #"<video src="/video.mp4" controls="" autoplay="" muted="" loop="" width="640" height="480" poster="/poster.jpg"></video>"#
    )
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Video {
      DOMString("Your browser does not support the video tag.")
    }) == """
<video>
 Your browser does not support the video tag.
</video>
""")
  }

  @Test func withContentAndControls() throws {
    try #expect(renderHTML(Video {
      DOMString("Your browser does not support the video tag.")
    }.controls()) == """
<video controls="">
 Your browser does not support the video tag.
</video>
""")
  }

  @Test func emptyContent() throws {
    try #expect(renderHTML(Video {}) == "<video></video>")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Video(URL(string: "/video.mp4")).language("en")) == #"<video src="/video.mp4" lang="en"></video>"#)
  }
}
