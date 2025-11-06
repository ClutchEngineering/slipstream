import Foundation
import Testing

import Slipstream

struct NoscriptTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Noscript {}) == "<noscript></noscript>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Noscript {
      DOMString("JavaScript is disabled")
    }) == """
<noscript>
 JavaScript is disabled
</noscript>
""")
  }

  @Test func withStringInitializer() throws {
    try #expect(renderHTML(Noscript("Please enable JavaScript")) == """
<noscript>
 Please enable JavaScript
</noscript>
""")
  }

  @Test func withParagraph() throws {
    try #expect(renderHTML(Noscript {
      Paragraph {
        DOMString("This site requires JavaScript.")
      }
    }) == """
<noscript>
 <p>This site requires JavaScript.</p>
</noscript>
""")
  }

  @Test func withComplexContent() throws {
    try #expect(renderHTML(Noscript {
      Div {
        H2 {
          DOMString("JavaScript Required")
        }
        Paragraph {
          DOMString("Please enable JavaScript to view this site.")
        }
      }
    }) == """
<noscript>
 <div>
  <h2>JavaScript Required</h2>
  <p>Please enable JavaScript to view this site.</p>
 </div>
</noscript>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Noscript {}.language("en")) == #"<noscript lang="en"></noscript>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(renderHTML(Noscript {}.id("fallback").language("en")) == #"<noscript id="fallback" lang="en"></noscript>"#)
  }

  @Test func withClassAttribute() throws {
    try #expect(renderHTML(Noscript {}.className("fallback-content")) == #"<noscript class="fallback-content"></noscript>"#)
  }
}
