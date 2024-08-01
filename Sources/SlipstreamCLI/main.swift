import Slipstream

struct HelloWorld: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(HelloWorld()))
