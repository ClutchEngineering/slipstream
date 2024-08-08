# ``Slipstream``

Build static web pages with Swift and Tailwind CSS.

![The Slipstream logo. The Swift bird logo is flying off the edge of the Tailwind CSS wind logo.](logo)

Slipstream is a declarative framework that allows you to write SwiftUI-like
code to generate HTML compatible with [Tailwind CSS](https://tailwindcss.com/docs/installation),
a utility-first CSS framework.

By using a SwiftUI-like domain-specific language (DSL), Slipstream provides a
familiar syntax for Swift developers, making it easy to create and style web
components without leaving the Swift ecosystem.

```swift
import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
```

### Key features

- **Familiar to SwiftUI developers**: Write SwiftUI-like code to define your
  web page's structure and style. <doc:SlipstreamforSwiftUIDevelopers> provides
  a cookbook of comparable APIs.

- **Tailwind CSS Integration**: Slipstream outputs HTML that is fully
  compatible with [Tailwind CSS](https://tailwindcss.com).

- **Static Site Generation**: Ideal for static web pages, Slipstream generates
  static HTML files, which can be easily hosted on any web server or deployed
  to static site hosting platforms such as GitHub Pages.

- **Composable**: Build reusable components and compose them to create more
  complex views.

- **Flexible Rendering**: As a framework, Slipstream can be integrated into any
  type of static website, whether it's a blog, portfolio, product landing page,
  or your personal pet project (maybe even literally a webpage for your pet?). 

## Topics

### Tutorials

- <doc:IntroducingSlipstream>

### Guides

- <doc:SlipstreamforSwiftUIDevelopers>

### Architecture

- <doc:HowSlipstreamWorks>
- <doc:HowEnvironmentWorks>

### Data and storage

- <doc:EnvironmentValuesSection>

### Views

- <doc:Fundamentals>
- <doc:Stacks>
- ``Text``

### Tailwind CSS

- <doc:TailwindCSS-Conditions>
- <doc:TailwindCSS-Utilities>

### Markdown

- ``MarkdownText``

### W3C

- <doc:W3CViews>
- <doc:W3CAttributes>

### Rendering views

- <doc:RenderView>
- <doc:RenderSitemap>
