import Foundation

import Slipstream

struct NavigationBar: View {
  let activePage: String

  @ViewBuilder
  private func navLink(_ title: String, page: String, url: String) -> some View {
    let isActive = activePage == page
    Link(title, destination: URL(string: url))
      .textColor(isActive ? .blue : .gray, darkness: isActive ? 600 : 700)
      .bold(isActive)
      .textColor(.blue, darkness: 600, condition: .hover)
  }

  var body: some View {
    Navigation {
      Container {
        HStack(alignment: .center, spacing: 24) {
          navLink("Home", page: "home", url: "index.html")
          navLink("About", page: "about", url: "about.html")
          navLink("Gallery", page: "gallery", url: "gallery.html")
        }
        .padding(.vertical, 16)
      }
    }
    .background(.white)
    .border(.bottom, width: 1, color: .gray, darkness: 200)
    .shadow(.small)
  }
}

struct PageFooter: View {
  var body: some View {
    Footer {
      Container {
        Div {
          Text("© 2024 Coco's Website. All rights reserved.")
            .textColor(.gray, darkness: 600)
            .fontSize(.small)
        }
        .padding(.vertical, 24)
        .textAlignment(.center)
      }
    }
    .background(.gray, darkness: 50)
    .border(.top, width: 1, color: .gray, darkness: 200)
    .margin(.top, 64)
  }
}

struct PageLayout<Content: View>: View {
  let activePage: String
  @ViewBuilder let content: () -> Content

  var body: some View {
    HTML {
      Head {
        Stylesheet(URL(string: "main.css"))
      }
      Body {
        NavigationBar(activePage: activePage)
        Container {
          content()
        }
        .padding(.vertical, 48)
        PageFooter()
      }
    }
  }
}

struct Home: View {
  var body: some View {
    PageLayout(activePage: "home") {
      H1("Welcome to Coco's Website")
        .fontSize(.extraExtraExtraLarge)
        .bold()
      Text("Learn all about Coco the swimming pig!")
    }
  }
}

struct About: View {
  var body: some View {
    PageLayout(activePage: "about") {
      H1("About Coco")
        .fontSize(.extraExtraExtraLarge)
        .bold()
      Text("Coco is a swimming pig who lives in the beautiful Bahamas. She loves to swim in the crystal-clear waters and greet tourists who visit the beach.")
      Text("Swimming pigs have become one of the most popular attractions in the Bahamas, and Coco is one of the friendliest!")
    }
  }
}

struct Gallery: View {
  let photos = ["coco-swimming.jpg", "coco-beach.jpg", "coco-friends.jpg", "coco-sunset.jpg"]

  var body: some View {
    PageLayout(activePage: "gallery") {
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
