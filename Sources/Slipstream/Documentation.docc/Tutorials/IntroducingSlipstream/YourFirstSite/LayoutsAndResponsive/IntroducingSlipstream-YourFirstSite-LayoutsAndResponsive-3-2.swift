import Foundation

import Slipstream

struct Home: View {
  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        Container {
          H1("Coco's Photo Gallery")
            .bold()
            .fontSize(.extraExtraExtraLarge)
            .margin(.bottom, 32)

          Div {
            // Gallery items will go here
          }
          .display(.grid)
          .gridTemplateColumns(2)
          .gridTemplateColumns(3, condition: .startingAt(.medium))
          .gridTemplateColumns(4, condition: .startingAt(.large))
          .flexGap(16)
        }
        .padding(.vertical, 48)
      }
    }
  }
}

let sitemap: Sitemap = [
  "index.html": Home()
]

guard let projectURL = URL(filePath: #filePath)?
  .deletingLastPathComponent()
  .deletingLastPathComponent() else {
  print("Unable to create URL for \(#filePath)")
  exit(1)
}

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
