import Foundation
import Testing

import Slipstream

struct FigureTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Figure {}) == "<figure></figure>")
  }

  @Test func withContent() throws {
    try #expect(renderHTML(Figure {
      DOMString("Chart content")
    }) == """
<figure>
 Chart content
</figure>
""")
  }

  @Test func withImage() throws {
    try #expect(renderHTML(Figure {
      Image(URL(string: "/images/chart.png")!)
    }) == """
<figure>
 <img src="/images/chart.png" />
</figure>
""")
  }
}
