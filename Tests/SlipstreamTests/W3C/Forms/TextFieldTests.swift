import Testing

import Slipstream

struct TextFieldTests {
  @Test func placeholder() throws {
    try #expect(renderHTML(TextField("Placeholder")) == #"<input type="text" placeholder="Placeholder" />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(TextField("Placeholder", autoFocus: true)) == #"<input type="text" placeholder="Placeholder" autofocus />"#)
  }

  @Test func withType() throws {
    try #expect(renderHTML(TextField("Placeholder", type: .text)) == #"<input type="text" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .search)) == #"<input type="search" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .telephone)) == #"<input type="tel" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .url)) == #"<input type="url" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .email)) == #"<input type="email" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .password)) == #"<input type="password" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .date)) == #"<input type="date" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .month)) == #"<input type="month" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .week)) == #"<input type="week" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .time)) == #"<input type="time" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .localDateAndTime)) == #"<input type="datetime-local" placeholder="Placeholder" />"#)
    try #expect(renderHTML(TextField("Placeholder", type: .number)) == #"<input type="number" placeholder="Placeholder" />"#)
  }
}
