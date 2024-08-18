import Testing

import Markdown
import Slipstream

private enum TableContext {
  case header
  case body
}

private struct TableContextEnvironmentKey: EnvironmentKey {
  static let defaultValue: TableContext = .body
}

extension EnvironmentValues {
  fileprivate var tableContext: TableContext {
    get { self[TableContextEnvironmentKey.self] }
    set { self[TableContextEnvironmentKey.self] = newValue }
  }
}

private struct ContextAwareTableCell<Content: View>: View {
  @Environment(\.tableContext) var tableContext

  @ViewBuilder let content: () -> Content

  var body: some View {
    switch tableContext {
    case .header:
      Slipstream.TableHeaderCell {
        content()
      }
    case .body:
      Slipstream.TableCell {
        content()
      }
    }
  }
}

private struct MarkdownArticle: View {
  var body: some View {
    MarkdownText("""
## Hello world

This is some markdown content.

| Column 1 | Column 2 |
|:---------|:---------|
| Row 1a | Row 1b |
| Row 2a | Row 2b |
"""
    ) { node, context in
      switch node {
      case let text as Markdown.Text:
        Slipstream.DOMString(text.string)
      case let heading as Markdown.Heading:
        Slipstream.Heading(level: heading.level) {
          context.recurse()
        }
      case is Markdown.Paragraph:
        Slipstream.Paragraph {
          context.recurse()
        }
      case let table as Markdown.Table:
        Slipstream.Table {
          Slipstream.TableHeader {
            context.recurseDetached(into: table.head)
              .environment(\.tableContext, .header)
          }
          Slipstream.TableBody {
            context.recurseDetached(into: table.body)
              .environment(\.tableContext, .body)
          }
        }
      case is Markdown.Table.Row:
        Slipstream.TableRow {
          context.recurse()
        }
      case is Markdown.Table.Cell:
        ContextAwareTableCell {
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
<table>
 <thead>
  <th>Column 1</th>
  <th>Column 2</th>
 </thead>
 <tbody>
  <tr>
   <td>Row 1a</td>
   <td>Row 1b</td>
  </tr>
  <tr>
   <td>Row 2a</td>
   <td>Row 2b</td>
  </tr>
 </tbody>
</table>
""")
  }
}
