import Slipstream

struct Home: View {
  var body: some View {
    Text("Hello, world!")
  }
}

let sitemap: Sitemap = [
  "index.html": Home()
]

print(try renderHTML(Home()))
