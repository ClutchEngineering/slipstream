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
          VStack(alignment: .leading, spacing: 16) {
            Text("Coco the Swimming Pig")
            Text("Coco lives in the Bahamas and loves to swim in the crystal-clear waters.")
            Image(URL(string: "coco.jpg"))
            HStack(alignment: .center, spacing: 24) {
              VStack(alignment: .leading, spacing: 4) {
                Text("Location")
                  .bold()
                Text("Bahamas")
              }
              VStack(alignment: .leading, spacing: 4) {
                Text("Activity")
                  .bold()
                Text("Swimming")
              }
              VStack(alignment: .leading, spacing: 4) {
                Text("Species")
                  .bold()
                Text("Pig")
              }
            }
          }
        }
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
