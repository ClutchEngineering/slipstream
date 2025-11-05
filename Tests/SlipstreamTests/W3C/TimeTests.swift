import Testing

import Slipstream

struct TimeTests {
  @Test func emptyBlock() throws {
    try #expect(renderHTML(Time {}) == "<time></time>")
  }

  @Test func withText() throws {
    try #expect(renderHTML(Time {
      DOMString("December 25, 2024")
    }) == """
<time>December 25, 2024</time>
""")
  }

  @Test func withTextInitializer() throws {
    try #expect(renderHTML(Time("7:00 PM")) == "<time>7:00 PM</time>")
  }

  @Test func withDatetimeDate() throws {
    try #expect(renderHTML(Time("December 25, 2024", datetime: "2024-12-25")) == #"<time datetime="2024-12-25">December 25, 2024</time>"#)
  }

  @Test func withDatetimeTime() throws {
    try #expect(renderHTML(Time("7:00 PM", datetime: "19:00")) == #"<time datetime="19:00">7:00 PM</time>"#)
  }

  @Test func withDatetimeDateTime() throws {
    try #expect(renderHTML(Time("December 25, 2024 at 7:00 PM", datetime: "2024-12-25T19:00:00Z")) == #"<time datetime="2024-12-25T19:00:00Z">December 25, 2024 at 7:00 PM</time>"#)
  }

  @Test func withDatetimeDuration() throws {
    try #expect(renderHTML(Time("2 hours and 30 minutes", datetime: "PT2H30M")) == #"<time datetime="PT2H30M">2 hours and 30 minutes</time>"#)
  }

  @Test func withDatetimeViewBuilder() throws {
    try #expect(renderHTML(Time(datetime: "2024-12-25") {
      DOMString("Christmas Day")
    }) == #"<time datetime="2024-12-25">Christmas Day</time>"#)
  }

  @Test func withNestedContent() throws {
    try #expect(renderHTML(Time(datetime: "2024-12-25") {
      Strong("December 25, 2024")
    }) == #"<time datetime="2024-12-25"><strong>December 25, 2024</strong></time>"#)
  }

  @Test func globalAttribute() throws {
    try #expect(renderHTML(Time("7:00 PM").language("en")) == #"<time lang="en">7:00 PM</time>"#)
  }

  @Test func globalAttributeWithDatetime() throws {
    try #expect(renderHTML(Time("7:00 PM", datetime: "19:00").language("en")) == #"<time datetime="19:00" lang="en">7:00 PM</time>"#)
  }
}
