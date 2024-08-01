/// Source: https://github.com/gor-gyolchanyan-swift/introspection-kit
package struct TypeIntrospection {
  package let type: Any.Type
  package init(type: Any.Type) {
    self.type = type
  }

  package var properties: Properties {
    Properties(parent: self)
  }
}
