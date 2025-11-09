import Foundation

import Slipstream

struct Contact: View {
  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        Container {
          H1("Contact Coco")
            .fontSize(.extraExtraExtraLarge)
            .bold()
            .margin(.bottom, 32)

          Text("Want to say hello to Coco? Fill out the form below!")
            .margin(.bottom, 24)

          Form(method: .post, url: URL(string: "/submit")) {
            TextField("Your name", type: .text, name: "name")
            TextField("Your email", type: .email, name: "email")
            TextArea("Your message", name: "message", rows: 5)
          }
        }
        .padding(.vertical, 48)
      }
    }
  }
}

let sitemap: Sitemap = [
  "contact.html": Contact()
]

guard let projectURL = URL(filePath: #filePath)?
  .deletingLastPathComponent()
  .deletingLastPathComponent() else {
  print("Unable to create URL for \(#filePath)")
  exit(1)
}

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
