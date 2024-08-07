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

```
import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
```

## Documentation

View Slipstream's [complete documentation](https://jverkoey.github.io/slipstream/documentation/slipstream/).

## Community

To discuss Slipstream-related topics with other Slipstreamers, ask questions, or explore ideas, please [use GitHub discussions](https://github.com/jverkoey/slipstream/discussions).
