import Slipstream

struct Home: View {
  var body: some View {
    Text("Hello, world!")
  }
}

print(try renderHTML(Home()))
