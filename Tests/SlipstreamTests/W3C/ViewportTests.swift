import Testing

import Slipstream

struct ViewportTests {
  @Test func defaults() throws {
    try #expect(renderHTML(Viewport()) == #""#)
  }

  @Test func mobileStandard() throws {
    try #expect(renderHTML(Viewport.mobileFriendly) == #"<meta name="viewport" content="width=device-width, initial-scale=1" />"#)
  }

  @Test func fullyConfigured() throws {
    try #expect(
      renderHTML(
        Viewport(
          width: .pixels(500),
          height: .deviceHeight,
          initialScale: 2.0,
          minimumScale: 0.5,
          maximumScale: 5.0,
          userScalable: false,
          viewportFit: .cover
        )
      ) == #"<meta name="viewport" content="width=500, height=device-height, initial-scale=2, minimum-scale=0.5, maximum-scale=5, user-scalable=no, viewport-fit=cover" />"#
    )
  }
}
