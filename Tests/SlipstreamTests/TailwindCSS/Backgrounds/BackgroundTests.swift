import Foundation
import Testing

import Slipstream

struct BackgroundImageTests {
  // MARK: - Color backgrounds

  @Test func color() throws {
    try #expect(renderHTML(Div {}.background(.black)) == #"<div class="bg-black"></div>"#)
    try #expect(renderHTML(Div {}.background(.white)) == #"<div class="bg-white"></div>"#)
    try #expect(renderHTML(Div {}.background(.white)) == #"<div class="bg-white"></div>"#)
  }

  @Test func colorWithDarkness() throws {
    try #expect(renderHTML(Div {}.background(.cyan, darkness: 500)) == #"<div class="bg-cyan-500"></div>"#)
  }

  @Test func colorWithOpacity() throws {
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(0))) == #"<div class="bg-cyan-500/0"></div>"#)
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(0.5))) == #"<div class="bg-cyan-500/50"></div>"#)
    try #expect(renderHTML(Div {}.background(.init(.cyan, darkness: 500).opacity(20))) == #"<div class="bg-cyan-500"></div>"#)
  }

  // MARK: - Image backgrounds

  @Test func justURL() throws {
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"))) == #"<div class="bg-[url('/logo.png')]"></div>"#)
  }

  @Test func withRepeat() throws {
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .no)) == #"<div class="bg-[url('/logo.png')] bg-no-repeat"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .yes)) == #"<div class="bg-[url('/logo.png')] bg-repeat"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .x)) == #"<div class="bg-[url('/logo.png')] bg-repeat-x"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .y)) == #"<div class="bg-[url('/logo.png')] bg-repeat-y"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .round)) == #"<div class="bg-[url('/logo.png')] bg-repeat-round"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), repeat: .space)) == #"<div class="bg-[url('/logo.png')] bg-repeat-space"></div>"#)
  }

  @Test func withSize() throws {
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), size: .auto)) == #"<div class="bg-[url('/logo.png')] bg-auto"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), size: .contain)) == #"<div class="bg-[url('/logo.png')] bg-contain"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), size: .cover)) == #"<div class="bg-[url('/logo.png')] bg-cover"></div>"#)
    try #expect(renderHTML(Div {}.background(URL(string: "/logo.png"), size: .size(width: 100, height: 50))) == #"<div class="bg-[length:100px_50px] bg-[url('/logo.png')]"></div>"#)
  }

  // MARK: - Material backgrounds

  @Test func material() throws {
    try #expect(renderHTML(Div {}.background(.ultraThin)) == #"<div class="backdrop-blur-sm"></div>"#)
    try #expect(renderHTML(Div {}.background(.thin)) == #"<div class="backdrop-blur"></div>"#)
    try #expect(renderHTML(Div {}.background(.regular)) == #"<div class="backdrop-blur-md"></div>"#)
    try #expect(renderHTML(Div {}.background(.thick)) == #"<div class="backdrop-blur-lg"></div>"#)
    try #expect(renderHTML(Div {}.background(.ultraThick)) == #"<div class="backdrop-blur-xl"></div>"#)
    try #expect(renderHTML(Div {}.background(.ultraUltraThick)) == #"<div class="backdrop-blur-2xl"></div>"#)
    try #expect(renderHTML(Div {}.background(.ultraUltraUltraThick)) == #"<div class="backdrop-blur-3xl"></div>"#)
  }
}
