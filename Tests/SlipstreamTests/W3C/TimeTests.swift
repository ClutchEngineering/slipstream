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

    // Use a specific format that produces predictable output
    let format = Date.FormatStyle()
      .year(.defaultDigits)
      .month(.twoDigits)
      .day(.twoDigits)
      .locale(Locale(identifier: "en_US"))

    let html = try renderHTML(Time(date, format: format))

    // The datetime attribute should be ISO 8601 formatted
    // The display format should be MM/dd/yyyy in en_US locale
    #expect(html == #"<time datetime="2024-12-25T19:00:00Z">12/25/2024</time>"#)
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

    // Use a simple format to avoid locale-specific variations in "at" separator
    let format = Date.FormatStyle()
      .year(.defaultDigits)
      .month(.abbreviated)
      .day(.twoDigits)
      .locale(Locale(identifier: "en_US_POSIX"))

    let html = try renderHTML(Time(date, format: format))

    // Should produce exact ISO 8601 datetime and formatted display
    #expect(html == #"<time datetime="2024-01-15T10:30:00Z">Jan 15, 2024</time>"#)
  }

  @Test func withDateObjectWideMonthFormat() throws {
    // Create a specific date
    var components = DateComponents()
    components.year = 2024
    components.month = 1
    components.day = 15
    components.hour = 14
    components.minute = 30
    components.second = 0
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    // Test with wide month format
    let format = Date.FormatStyle()
      .year(.defaultDigits)
      .month(.wide)
      .locale(Locale(identifier: "en_US_POSIX"))

    let html = try renderHTML(Time(date, format: format))

    // Should produce exact ISO 8601 datetime with full month name and year
    #expect(html == #"<time datetime="2024-01-15T14:30:00Z">January 2024</time>"#)
  }

  @Test func withDateObjectAbbreviatedFormat() throws {
    // Create a specific date
    var components = DateComponents()
    components.year = 2024
    components.month = 6
    components.day = 15
    components.hour = 10
    components.minute = 0
    components.second = 0
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    // Test abbreviated month format
    let format = Date.FormatStyle()
      .year(.defaultDigits)
      .month(.abbreviated)
      .day(.twoDigits)
      .locale(Locale(identifier: "en_US"))

    let html = try renderHTML(Time(date, format: format))

    // Exact output with ISO 8601 datetime
    #expect(html == #"<time datetime="2024-06-15T10:00:00Z">Jun 15, 2024</time>"#)
  }

  @Test func withDateObjectAndGlobalAttribute() throws {
    var components = DateComponents()
    components.year = 2024
    components.month = 6
    components.day = 1
    components.hour = 14
    components.minute = 30
    components.second = 0
    components.timeZone = TimeZone(identifier: "UTC")

    let date = Calendar.current.date(from: components)!

    let format = Date.FormatStyle()
      .year(.defaultDigits)
      .month(.twoDigits)
      .day(.twoDigits)
      .locale(Locale(identifier: "en_US"))

    let html = try renderHTML(Time(date, format: format).language("en"))

    // Should have both datetime and lang attributes in exact format
    #expect(html == #"<time datetime="2024-06-01T14:30:00Z" lang="en">06/01/2024</time>"#)
  }
}
