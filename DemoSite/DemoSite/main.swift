import Foundation

import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

// Standard single-threaded rendering

print(try renderHTML(HelloWorld()))

// Parallel sitemap rendering

print(try await renderSitemap([
  "index.html": HelloWorld(),
  "home.html": HelloWorld(),
]))
