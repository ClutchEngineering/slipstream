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
          ResponsiveStack(.x, condition: .startingAt(.medium), spacing: 32) {
            Image(URL(string: "coco.jpg"))
              .frame(width: .full)
              .frame(width: 300, condition: .startingAt(.medium))
              .cornerRadius(.large)
            VStack(alignment: .leading, spacing: 16) {
              Text("Coco the Swimming Pig")
                .fontSize(.extraExtraLarge)
                .fontSize(.extraExtraExtraLarge, condition: .startingAt(.large))
                .bold()
              Text("Coco lives in the Bahamas and loves to swim in the crystal-clear waters.")
              HStack(alignment: .center, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                  Text("Location")
                    .bold()
                    .textColor(.gray, darkness: 600)
                  Text("Bahamas")
                }
                VStack(alignment: .leading, spacing: 4) {
                  Text("Activity")
                    .bold()
                    .textColor(.gray, darkness: 600)
                  Text("Swimming")
                }
                VStack(alignment: .leading, spacing: 4) {
                  Text("Species")
                    .bold()
                    .textColor(.gray, darkness: 600)
                  Text("Pig")
                }
              }
            }
          }
          .padding(16)
          .padding(24, condition: .startingAt(.medium))
          .background(.white)
          .cornerRadius(.extraLarge)
          .shadow(.extraLarge)
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
