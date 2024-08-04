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
        Container {
          Text("Hello")
          Linebreak()
          Text("world!")

          Link("About", destination: URL(string: "/about"))

          Link(URL(string: "/home")) {
            Text("Home")
          }

          VStack {
            HStack(spacing: 10) {
              H1("Heading 1")
                .fontSize(.extraLarge)
                .bold()
                .textAlignment(.leading)
              H2 {
                Text("Heading 2")
              }
              .fontSize(32)
              .textAlignment(.center)
            }
            H3("Heading 3")
              .textAlignment(.trailing)
            H4("Heading 4")
              .antialiased()
            H5("Heading 5")
              .margin(.horizontal, .auto)
            H6("Heading 6")
              .margin(.vertical, 32)
              .textColor(.white)
              .display(.hidden)
          }
          .flexGap(.x, width: 2)
        }
        .border(.black, width: 4, edges: .bottom)
        .textColor(.red, darkness: 800, condition: .dark)
        .padding(.horizontal, 48, condition: .minBreakpoint(.large))
        .animation(.easeInOut(duration: 0.3))
      }
      .id("root")
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
 <body id="root">
  <div class="container border-b-4 border-black dark:text-red-800 lg:px-12 duration-300 ease-in-out">
   Hello
   <br />world!
   <a href="/about">About</a>
   <a href="/home">Home</a>
   <div class="flex flex-col gap-x-0.5">
    <div class="flex flex-row gap-x-2.5">
     <h1 class="text-xl font-bold text-start">Heading 1</h1>
     <h2 class="text-3xl text-center">Heading 2</h2>
    </div>
    <h3 class="text-end">Heading 3</h3>
    <h4 class="antialiased">Heading 4</h4>
    <h5 class="mx-auto">Heading 5</h5>
    <h6 class="my-8 text-white hidden">Heading 6</h6>
   </div>
  </div>
 </body>
</html>
""")
  }
}
