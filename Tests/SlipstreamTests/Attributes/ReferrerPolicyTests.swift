import Foundation
import Testing
import Slipstream

struct ReferrerPolicyTests {
  @Test func defaultPolicy() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.default)) ==
      #"<a href="/" referrerpolicy="">Home</a>"#
    )
  }

  @Test func noReferrer() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.noReferrer)) ==
      #"<a href="/" referrerpolicy="no-referrer">Home</a>"#
    )
  }

  @Test func noReferrerWhenDowngrade() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.noReferrerWhenDowngrade)) ==
      #"<a href="/" referrerpolicy="no-referrer-when-downgrade">Home</a>"#
    )
  }

  @Test func origin() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.origin)) ==
      #"<a href="/" referrerpolicy="origin">Home</a>"#
    )
  }

  @Test func originWhenCrossOrigin() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.originWhenCrossOrigin)) ==
      #"<a href="/" referrerpolicy="origin-when-cross-origin">Home</a>"#
    )
  }

  @Test func sameOrigin() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.sameOrigin)) ==
      #"<a href="/" referrerpolicy="same-origin">Home</a>"#
    )
  }

  @Test func strictOrigin() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.strictOrigin)) ==
      #"<a href="/" referrerpolicy="strict-origin">Home</a>"#
    )
  }

  @Test func strictOriginWhenCrossOrigin() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.strictOriginWhenCrossOrigin)) ==
      #"<a href="/" referrerpolicy="strict-origin-when-cross-origin">Home</a>"#
    )
  }

  @Test func unsafeURL() throws {
    try #expect(
      renderHTML(Link("Home", destination: URL(string: "/")!).referrerPolicy(.unsafeURL)) ==
      #"<a href="/" referrerpolicy="unsafe-url">Home</a>"#
    )
  }

  @Test func onImage() throws {
    try #expect(
      renderHTML(Image(URL(string: "/logo.png")).referrerPolicy(.noReferrer)) ==
      #"<img src="/logo.png" referrerpolicy="no-referrer" />"#
    )
  }

  @Test func onDiv() throws {
    try #expect(
      renderHTML(Div {}.referrerPolicy(.strictOrigin)) ==
      #"<div referrerpolicy="strict-origin"></div>"#
    )
  }

  @Test func onIFrame() throws {
    try #expect(
      renderHTML(IFrame(URL(string: "/frame")!).referrerPolicy(.sameOrigin)) ==
      #"<iframe src="/frame" referrerpolicy="same-origin"></iframe>"#
    )
  }

  @Test func multipleAttributes() throws {
    try #expect(
      renderHTML(
        Link("Home", destination: URL(string: "/")!)
          .referrerPolicy(.noReferrer)
          .id("home-link")
      ) ==
      #"<a href="/" referrerpolicy="no-referrer" id="home-link">Home</a>"#
    )
  }
}
