# ``Slipstream``

Build static web pages with Swift and Tailwind CSS.

## Overview

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

- **SwiftUI-like DSL**: Write Swift code to define your web page's structure
  and styling. The DSL is designed to be intuitive and expressive, making it
  easy to create complex layouts with simple code.

- **Tailwind CSS Integration**: Slipstream outputs HTML that is fully
  compatible with Tailwind CSS, allowing you to leverage Tailwind's extensive
  library of utility classes for styling.

- **Static Site Generation**: Ideal for static web pages, Slipstream generates
  static HTML files, which can be easily hosted on any web server or deployed
  to static site hosting platforms such as GitHub Pages.

- **Modular and Composable**: Build reusable components and compose them to
  create more complex UI elements.

- **Flexible Rendering**: As a framework, Slipstream can be integrated into any
  type of static website, whether it's a blog, portfolio, product landing page,
  or your personal pet project (maybe even literally a webpage for your pet?). 

## Topics

### Architecture

- <doc:HowSlipstreamWorks>
- <doc:HowEnvironmentWorks>

### Data and storage

- <doc:EnvironmentValuesSection>

### Views

- <doc:Fundamentals>
- <doc:TextInputAndOutput>

### W3C

- <doc:W3CViews>
- <doc:W3CAttributes>

### Rendering views

- ``renderHTML(_:)``
