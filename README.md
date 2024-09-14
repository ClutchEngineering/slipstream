<p align="center">
  <img alt="Tailwind CSS" src="https://raw.githubusercontent.com/jverkoey/slipstream/HEAD/.github/logo.svg" width="350" height="70" style="max-width: 100%;">
</p>

<p align="center">
  Build static web pages with Swift and Tailwind CSS.
</p>

<p align="center">
    <a href="https://github.com/jverkoey/slipstream/actions"><img src="https://img.shields.io/github/actions/workflow/status/jverkoey/slipstream/package-test.yml?branch=main" alt="Build Status"></a>
    <a href="https://github.com/jverkoey/slipstream/blob/main/LICENSE"><img src="https://img.shields.io/github/license/jverkoey/slipstream.svg" alt="License"></a>
</p>

---

**Slipstream** is a static site generator built for Swift developers.

## Usage

[Clone the Slipstream Site Template](https://github.com/jverkoey/slipstream-site-template/) for a
quick-start to deploying a Slipstream site to GitHub Pages.

### Create an executable Swift package

```bash
mkdir mysite
cd mysite
swift package init --type executable
```

### Add Slipstream to your package dependencies

```swift
dependencies: [
  .package(url: "https://github.com/jverkoey/slipstream.git", branch: "main"),
],
targets: [
  .executableTarget(name: "mysite", dependencies: [
    .product(name: "Slipstream", package: "slipstream"),
  ]
],
```

And off you go:

```swift
import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
```

### Render a sitemap

Slipstream intentionally avoids making strong opinions about how your documents should be structured
and written to disk. To help get you started though you can use Slipstream's lightweight sitemap
renderer to write a dictionary of Slipstream views to disk:

```swift
let sitemap: Sitemap = [
  "index.html": HelloWorld()
]

// Assumes this file is located in a Sources/ sub-directory of a Swift package.
guard let projectURL = URL(filePath: #filePath)?
  .deletingLastPathComponent()
  .deletingLastPathComponent() else {
  print("Unable to create URL for \(#filePath)")
  exit(1)
}

let outputURL = projectURL.appending(path: "site")

try renderSitemap(sitemap, to: outputURL)
```

## Documentation

View Slipstream's [complete documentation](https://jverkoey.github.io/slipstream/documentation/slipstream/).

## Community

To discuss Slipstream-related topics with other Slipstreamers, ask questions, or explore ideas, please [use GitHub discussions](https://github.com/jverkoey/slipstream/discussions).
