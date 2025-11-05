import Foundation
import Testing

import Slipstream

struct TemplateTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Template {}) == "<template></template>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Template {
      DOMString("Template content")
    }) == """
<template>Template content</template>
""")
  }

  @Test func withDiv() throws {
    try #expect(renderHTML(Template {
      Div {
        DOMString("Content inside div")
      }
    }) == """
<template>
 <div>Content inside div</div>
</template>
""")
  }

  @Test func withComplexContent() throws {
    try #expect(renderHTML(Template {
      Div {
        H2 {
          DOMString("Title")
        }
        Paragraph {
          DOMString("Description")
        }
      }
    }) == """
<template>
 <div>
  <h2>Title</h2>
  <p>Description</p>
 </div>
</template>
""")
  }

  @Test func nestedTemplates() throws {
    try #expect(renderHTML(Template {
      Div {
        Template {
          Paragraph {
            DOMString("Nested template")
          }
        }
      }
    }) == """
<template>
 <div>
  <template>
   <p>Nested template</p>
  </template>
 </div>
</template>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Template {}.language("en")) == #"<template lang="en"></template>"#)
  }

  @Test func multipleAttributes() throws {
    try #expect(renderHTML(Template {}.id("my-template").language("en")) == #"<template id="my-template" lang="en"></template>"#)
  }

  @Test func withClassAttribute() throws {
    try #expect(renderHTML(Template {}.className("template-class")) == #"<template class="template-class"></template>"#)
  }
}
