import Slipstream

struct HelloWorld: View {
  var body: some View {
    DOMString("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
