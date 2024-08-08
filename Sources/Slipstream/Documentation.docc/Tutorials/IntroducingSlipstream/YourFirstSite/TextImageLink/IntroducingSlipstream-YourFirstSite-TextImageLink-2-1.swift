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
          Text("Meet Coco the pig. Coco is a swimming pig from the Bahamas!")
          Link(
            "Learn more",
            destination: URL(string: "https://www.bahamas.com/experiences/official-home-swimming-pigs")
          )
          .textColor(Color(.blue, darkness: 500))
          Image(URL(string: "coco.jpeg"))
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
