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
          H1("Welcome to Coco's Website")
            .fontSize(.extraExtraExtraLarge)
            .bold()
          Text("Learn all about Coco the swimming pig!")
        }
        .padding(.vertical, 48)
      }
    }
  }
}

struct About: View {
  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        Container {
          H1("About Coco")
            .fontSize(.extraExtraExtraLarge)
            .bold()
          Text("Coco is a swimming pig who lives in the beautiful Bahamas. She loves to swim in the crystal-clear waters and greet tourists who visit the beach.")
          Text("Swimming pigs have become one of the most popular attractions in the Bahamas, and Coco is one of the friendliest!")
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
