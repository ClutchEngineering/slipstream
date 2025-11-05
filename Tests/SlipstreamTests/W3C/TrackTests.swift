import Foundation
import Testing

import Slipstream

struct TrackTests {
  @Test func nilURL() throws {
    try #expect(renderHTML(Track(nil)) == "")
  }

  @Test func url() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"))) == #"<track src="/subtitles.vtt" kind="subtitles">"#)
  }

  @Test func kindSubtitles() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"), kind: .subtitles)) == #"<track src="/subtitles.vtt" kind="subtitles">"#)
  }

  @Test func kindCaptions() throws {
    try #expect(renderHTML(Track(URL(string: "/captions.vtt"), kind: .captions)) == #"<track src="/captions.vtt" kind="captions">"#)
  }

  @Test func kindChapters() throws {
    try #expect(renderHTML(Track(URL(string: "/chapters.vtt"), kind: .chapters)) == #"<track src="/chapters.vtt" kind="chapters">"#)
  }

  @Test func kindDescriptions() throws {
    try #expect(renderHTML(Track(URL(string: "/descriptions.vtt"), kind: .descriptions)) == #"<track src="/descriptions.vtt" kind="descriptions">"#)
  }

  @Test func kindMetadata() throws {
    try #expect(renderHTML(Track(URL(string: "/metadata.vtt"), kind: .metadata)) == #"<track src="/metadata.vtt" kind="metadata">"#)
  }

  @Test func srclang() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"), srclang: "en")) == #"<track src="/subtitles.vtt" kind="subtitles" srclang="en">"#)
  }

  @Test func label() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"), label: "English")) == #"<track src="/subtitles.vtt" kind="subtitles" label="English">"#)
  }

  @Test func defaultTrue() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"), default: true)) == #"<track src="/subtitles.vtt" kind="subtitles" default="">"#)
  }

  @Test func defaultFalse() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt"), default: false)) == #"<track src="/subtitles.vtt" kind="subtitles">"#)
  }

  @Test func allAttributes() throws {
    try #expect(
      renderHTML(
        Track(
          URL(string: "/subtitles_en.vtt"),
          kind: .subtitles,
          srclang: "en",
          label: "English",
          default: true
        )
      ) == #"<track src="/subtitles_en.vtt" kind="subtitles" srclang="en" label="English" default="">"#
    )
  }

  @Test func multipleTracksInVideo() throws {
    try #expect(renderHTML(Video(controls: true) {
      Track(URL(string: "/subtitles_en.vtt"), kind: .subtitles, srclang: "en", label: "English", default: true)
      Track(URL(string: "/subtitles_es.vtt"), kind: .subtitles, srclang: "es", label: "Spanish")
    }) == """
<video controls>
 <track src="/subtitles_en.vtt" kind="subtitles" srclang="en" label="English" default="">
 <track src="/subtitles_es.vtt" kind="subtitles" srclang="es" label="Spanish">
</video>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Track(URL(string: "/subtitles.vtt")).language("en")) == #"<track src="/subtitles.vtt" kind="subtitles" lang="en">"#)
  }
}
