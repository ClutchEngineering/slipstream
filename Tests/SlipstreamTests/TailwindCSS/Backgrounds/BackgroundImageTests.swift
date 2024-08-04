import Foundation
import Testing

import Slipstream

struct BackgroundImageTests {
  @Test func justURL() throws {
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"))) == #"<div class="bg-[url('/logo.png')]"></div>"#)
  }

  @Test func withRepeat() throws {
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .no)) == #"<div class="bg-[url('/logo.png')] bg-no-repeat"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .yes)) == #"<div class="bg-[url('/logo.png')] bg-repeat"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .x)) == #"<div class="bg-[url('/logo.png')] bg-repeat-x"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .y)) == #"<div class="bg-[url('/logo.png')] bg-repeat-y"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .round)) == #"<div class="bg-[url('/logo.png')] bg-repeat-round"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), repeat: .space)) == #"<div class="bg-[url('/logo.png')] bg-repeat-space"></div>"#)
  }

  @Test func withSize() throws {
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), size: .auto)) == #"<div class="bg-[url('/logo.png')] bg-auto"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), size: .contain)) == #"<div class="bg-[url('/logo.png')] bg-contain"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), size: .cover)) == #"<div class="bg-[url('/logo.png')] bg-cover"></div>"#)
    try #expect(renderHTML(Div {}.backgroundImage(URL(string: "/logo.png"), size: .size(width: 100, height: 50))) == #"<div class="bg-[length:100px_50px] bg-[url('/logo.png')]"></div>"#)
  }
}
