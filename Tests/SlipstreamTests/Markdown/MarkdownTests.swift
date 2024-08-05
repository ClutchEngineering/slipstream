import Testing

import Markdown
import Slipstream

private struct MarkdownArticle: View {
  var body: some View {
    MarkdownText("""
## Hello world

This is some markdown content.
"""
    ) { node, context in
      switch node {
      case let text as Markdown.Text:
        Slipstream.Text(text.string)
      case let heading as Markdown.Heading:
        Slipstream.Heading(level: heading.level) {
          context.recurse()
        }
      case is Markdown.Paragraph:
        Slipstream.Paragraph {
          context.recurse()
        }
      default:
        context.recurse()
      }
    }
  }
}

struct MarkdownTests {
  @Test func renders() throws {
    try #expect(renderHTML(MarkdownArticle()) == """
<h2>Hello world</h2>
<p>This is some markdown content.</p>
""")
  }
}
