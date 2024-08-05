import Testing
import Slipstream

struct DisplayTests {
  @Test func enumeration() throws {
    try #expect(renderHTML(Div {}.display(.block)) == #"<div class="block"></div>"#)
    try #expect(renderHTML(Div {}.display(.inlineBlock)) == #"<div class="inline-block"></div>"#)
    try #expect(renderHTML(Div {}.display(.inline)) == #"<div class="inline"></div>"#)
    try #expect(renderHTML(Div {}.display(.flex)) == #"<div class="flex"></div>"#)
    try #expect(renderHTML(Div {}.display(.inlineFlex)) == #"<div class="inline-flex"></div>"#)
    try #expect(renderHTML(Div {}.display(.table)) == #"<div class="table"></div>"#)
    try #expect(renderHTML(Div {}.display(.inlineTable)) == #"<div class="inline-table"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableCaption)) == #"<div class="table-caption"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableCell)) == #"<div class="table-cell"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableColumn)) == #"<div class="table-column"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableColumnGroup)) == #"<div class="table-column-group"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableFooterGroup)) == #"<div class="table-footer-group"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableHeaderGroup)) == #"<div class="table-header-group"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableRowGroup)) == #"<div class="table-row-group"></div>"#)
    try #expect(renderHTML(Div {}.display(.tableRow)) == #"<div class="table-row"></div>"#)
    try #expect(renderHTML(Div {}.display(.flowRoot)) == #"<div class="flow-root"></div>"#)
    try #expect(renderHTML(Div {}.display(.grid)) == #"<div class="grid"></div>"#)
    try #expect(renderHTML(Div {}.display(.inlineGrid)) == #"<div class="inline-grid"></div>"#)
    try #expect(renderHTML(Div {}.display(.contents)) == #"<div class="contents"></div>"#)
    try #expect(renderHTML(Div {}.display(.listItem)) == #"<div class="list-item"></div>"#)
    try #expect(renderHTML(Div {}.display(.hidden)) == #"<div class="hidden"></div>"#)
  }

  @Test func condition() throws {
    try #expect(
      renderHTML(
        Div {
        }.display(
          .block,
          condition: .init(startingAt: .medium)
        )) == #"<div class="md:block"></div>"#
    )
  }
}
