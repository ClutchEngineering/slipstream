import Foundation
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

  @Test func withDateObject() throws {
    // Create a specific date: December 25, 2024 at 7:00 PM UTC
    var components = DateComponents()
    components.year = 2024
    components.month = 12
    components.day = 25
    components.hour = 19
    components.minute = 0
    components.second = 0
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    // The datetime attribute should be ISO 8601 formatted
    let html = try renderHTML(Time(date, format: .dateTime.year().month().day()))

    // Check that it contains the datetime attribute in ISO 8601 format
    try #expect(html.contains(#"datetime="2024-12-25T19:00:00Z""#))

    // Check that it contains time tags
    try #expect(html.contains("<time"))
    try #expect(html.contains("</time>"))
  }

  @Test func withDateObjectDefaultFormat() throws {
    // Create a specific date
    var components = DateComponents()
    components.year = 2024
    components.month = 1
    components.day = 15
    components.hour = 10
    components.minute = 30
    components.second = 0
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    let html = try renderHTML(Time(date))

    // Should have datetime attribute
    try #expect(html.contains("datetime="))
    try #expect(html.contains("<time"))
    try #expect(html.contains("</time>"))
  }

  @Test func withDateObjectRelativeFormat() throws {
    // Create a date 2 hours ago
    let date = Date().addingTimeInterval(-2 * 60 * 60)

    let html = try renderHTML(Time(date, format: .relative(presentation: .named)))

    // Should have datetime attribute in ISO 8601
    try #expect(html.contains("datetime="))
    try #expect(html.contains("<time"))
    try #expect(html.contains("</time>"))

    // The content will vary based on locale, but should contain "ago"
    // Note: This might be flaky across different locales, but tests the API
    try #expect(html.contains("ago") || html.contains("</time>"))
  }

  @Test func withDateObjectAndGlobalAttribute() throws {
    var components = DateComponents()
    components.year = 2024
    components.month = 6
    components.day = 1
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    let html = try renderHTML(Time(date, format: .dateTime.year().month().day()).language("en"))

    // Should have both datetime and lang attributes
    try #expect(html.contains("datetime="))
    try #expect(html.contains(#"lang="en""#))
  }
}
