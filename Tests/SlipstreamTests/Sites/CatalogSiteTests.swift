import Foundation
import Testing

import Slipstream

/// This view is meant to provide an exhaustive implementation of the W3C views supported by Slipstream.
private struct CatalogSite: View {
  var body: some View {
    HTML {
      Head {
        Charset(.utf8)
        Title("Build websites with Swift and Tailwind CSS — Slipstream")
        Viewport.mobileFriendly
        Meta(.description, content: "Slipstream is a static website generator built in the Swift programming language and compatible with Tailwind CSS.")
        Stylesheet(URL(string: "/css/bootstrap.css"))
      }
      Body {
        Text("Hello, world!")
      }
    }
  }
}

struct CatalogSiteTests {
  @Test func rendered() throws {
    try #expect(renderHTML(CatalogSite()) == """
<html>
 <head>
  <meta charset="UTF-8" />
  <title>Build websites with Swift and Tailwind CSS — Slipstream</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="Slipstream is a static website generator built in the Swift programming language and compatible with Tailwind CSS." />
  <link rel="stylesheet" href="/css/bootstrap.css" />
 </head>
 <body>
  Hello, world!
 </body>
</html>
""")
  }
}
