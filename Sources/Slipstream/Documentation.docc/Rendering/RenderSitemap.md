# Render a sitemap

Utilities for rendering a collection of views to disk.

When building a static website you'll frequently need a
simple mechanism for rendering a set of views to a
corresponding set of paths.

The following example renders a hypothetical set of views
to the current user's home directory in a folder named
`mysite`:

```swift
let sitemap: Sitemap = [
  "index.html": Home(),
  "about/index.html": About(),
  "contact/index.html": Contact(),
  "portfolio/index.html": Portfolio(),
]

let output = FileManager.default.homeDirectoryForCurrentUser.appending(path: "mysite")
try renderSitemap(sitemap, to: output)
```

## Topics

### Methods

- ``renderSitemap(_:to:encoding:)``

### Supporting types

- ``Sitemap``
- ``RelativePath``
