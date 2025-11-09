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

struct Gallery: View {
  let photos = ["coco-swimming.jpg", "coco-beach.jpg", "coco-friends.jpg", "coco-sunset.jpg"]

  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        Container {
          H1("Photo Gallery")
            .fontSize(.extraExtraExtraLarge)
            .bold()
            .margin(.bottom, 32)

          Div {
            ForEach(photos, id: \.self) { photo in
              Image(URL(string: photo))
                .cornerRadius(.large)
            }
          }
          .display(.grid)
          .gridTemplateColumns(2)
          .gridTemplateColumns(3, condition: .startingAt(.medium))
          .flexGap(16)
        }
        .padding(.vertical, 48)
      }
    }
  }
}

let sitemap: Sitemap = [
  "index.html": Home(),
  "about.html": About(),
  "gallery.html": Gallery()
]

guard let projectURL = URL(filePath: #filePath)?
  .deletingLastPathComponent()
  .deletingLastPathComponent() else {
  print("Unable to create URL for \(#filePath)")
  exit(1)
}

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
