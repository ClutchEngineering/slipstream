import Testing

import Slipstream

struct DetailsTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Details {}) == "<details></details>")
  }

  @Test func withSummary() throws {
    try #expect(renderHTML(Details {
      Summary("Click to expand")
    }) == """
<details>
 <summary>Click to expand</summary>
</details>
""")
  }

  @Test func withSummaryAndContent() throws {
    try #expect(renderHTML(Details {
      Summary("More information")
      Paragraph("This is the expanded content.")
    }) == """
<details>
 <summary>More information</summary>
 <p>This is the expanded content.</p>
</details>
""")
  }

  @Test func withMultipleChildren() throws {
    try #expect(renderHTML(Details {
      Summary("Details")
      Paragraph("First paragraph")
      Paragraph("Second paragraph")
    }) == """
<details>
 <summary>Details</summary>
 <p>First paragraph</p>
 <p>Second paragraph</p>
</details>
""")
  }

  @Test func inContext() throws {
    try #expect(renderHTML(Article {
      H1("FAQ")
      Details {
        Summary("What is HTML?")
        Paragraph("HTML is a markup language.")
      }
    }) == """
<article>
 <h1>FAQ</h1>
 <details>
  <summary>What is HTML?</summary>
  <p>HTML is a markup language.</p>
 </details>
</article>
""")
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Details {}.language("en")) == #"<details lang="en"></details>"#)
  }
}
