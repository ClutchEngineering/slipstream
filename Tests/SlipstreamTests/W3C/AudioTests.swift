import Foundation
import Testing

import Slipstream

struct AudioTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Audio(nil)) == "<audio></audio>")
  }

  @Test func url() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"))) == #"<audio src="/audio.mp3"></audio>"#)
  }

  @Test func controls() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), controls: true)) == #"<audio src="/audio.mp3" controls></audio>"#)
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), controls: false)) == #"<audio src="/audio.mp3"></audio>"#)
  }

  @Test func autoplay() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), autoplay: true)) == #"<audio src="/audio.mp3" autoplay=""></audio>"#)
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), autoplay: false)) == #"<audio src="/audio.mp3"></audio>"#)
  }

  @Test func muted() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), muted: true)) == #"<audio src="/audio.mp3" muted></audio>"#)
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), muted: false)) == #"<audio src="/audio.mp3"></audio>"#)
  }

  @Test func loop() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), loop: true)) == #"<audio src="/audio.mp3" loop=""></audio>"#)
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3"), loop: false)) == #"<audio src="/audio.mp3"></audio>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(
      renderHTML(
        Audio(
          URL(string: "/audio.mp3"),
          controls: true,
          autoplay: true,
          muted: true,
          loop: true
        )
      ) == #"<audio src="/audio.mp3" controls autoplay="" muted loop=""></audio>"#
    )
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Audio {
      DOMString("Your browser does not support the audio tag.")
    }) == """
<audio>
 Your browser does not support the audio tag.
</audio>
""")
  }

  @Test func withContentAndControls() throws {
    try #expect(renderHTML(Audio(controls: true) {
      DOMString("Your browser does not support the audio tag.")
    }) == """
<audio controls>
 Your browser does not support the audio tag.
</audio>
""")
  }

  @Test func emptyContent() throws {
    try #expect(renderHTML(Audio {}) == "<audio></audio>")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Audio(URL(string: "/audio.mp3")).language("en")) == #"<audio src="/audio.mp3" lang="en"></audio>"#)
  }
}
