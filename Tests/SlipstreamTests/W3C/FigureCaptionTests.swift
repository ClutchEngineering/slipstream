import Foundation
import Testing

import Slipstream

struct FigureCaptionTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(FigureCaption {}) == "<figcaption></figcaption>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(FigureCaption("Sales data for Q4 2024")) == """
<figcaption>
 Sales data for Q4 2024
</figcaption>
""")
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(FigureCaption {
      DOMString("Figure 1: ")
      Emphasis("Important chart")
    }) == """
<figcaption>
 Figure 1: 
 <em>Important chart</em>
</figcaption>
""")
  }

  @Test func withFigure() throws {
    try #expect(renderHTML(Figure {
      Image(URL(string: "/chart.png")!)
      FigureCaption("Sales data for Q4 2024")
    }) == """
<figure>
 <img src="/chart.png" />
 <figcaption>
  Sales data for Q4 2024
 </figcaption>
</figure>
""")
  }
}
