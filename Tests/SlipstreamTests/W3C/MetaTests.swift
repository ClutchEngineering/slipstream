import Testing

import Slipstream

struct MetaTests {
  @Test func standardNames() throws {
    try #expect(renderHTML(Meta(.applicationName, content: "Slipstream")) == #"<meta name="application-name" content="Slipstream" />"#)
    try #expect(renderHTML(Meta(.author, content: "Slipstream authors")) == #"<meta name="author" content="Slipstream authors" />"#)
    try #expect(renderHTML(Meta(.colorScheme, content: "dark")) == #"<meta name="color-scheme" content="dark" />"#)
    try #expect(renderHTML(Meta(.description, content: "Hello, world!")) == #"<meta name="description" content="Hello, world!" />"#)
    try #expect(renderHTML(Meta(.generator, content: "Slipstream")) == #"<meta name="generator" content="Slipstream" />"#)
    try #expect(renderHTML(Meta(.keywords, content: "Swift,Tailwind CSS")) == #"<meta name="keywords" content="Swift,Tailwind CSS" />"#)
    try #expect(renderHTML(Meta(.referrer, content: "no-referrer")) == #"<meta name="referrer" content="no-referrer" />"#)
    try #expect(renderHTML(Meta(.themeColor, content: "white")) == #"<meta name="theme-color" content="white" />"#)
  }

  @Test func customNames() throws {
    try #expect(renderHTML(Meta("foo", content: "bar")) == #"<meta name="foo" content="bar" />"#)
  }

  @Test func openGraphValues() throws {
    try #expect(renderHTML(Meta("og:site_name", content: "Slipstream")) == #"<meta property="og:site_name" content="Slipstream" />"#)
  }
}
