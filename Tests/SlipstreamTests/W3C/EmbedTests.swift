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

  @Test func urlWithMimeTypeEnum() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/video.mp4"), type: .videoMP4)) == #"<embed src="/media/video.mp4" type="video/mp4" />"#)
  }

  @Test func urlWithMimeTypeString() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/video.mp4"), type: "video/mp4")) == #"<embed src="/media/video.mp4" type="video/mp4" />"#)
  }

  @Test func urlWithCustomMimeType() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/custom.bin"), type: "application/x-custom")) == #"<embed src="/media/custom.bin" type="application/x-custom" />"#)
  }

  @Test func differentMimeTypes() throws {
    try #expect(renderHTML(Embed(URL(string: "/media/audio.mp3"), type: .audioMPEG)) == #"<embed src="/media/audio.mp3" type="audio/mpeg" />"#)
    try #expect(renderHTML(Embed(URL(string: "/document.pdf"), type: .applicationPDF)) == #"<embed src="/document.pdf" type="application/pdf" />"#)
    try #expect(renderHTML(Embed(URL(string: "/image.svg"), type: .imageSVG)) == #"<embed src="/image.svg" type="image/svg+xml" />"#)
  }
}
