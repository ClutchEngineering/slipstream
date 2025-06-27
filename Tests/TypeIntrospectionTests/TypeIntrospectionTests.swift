import Testing

import TypeIntrospection

final class SomeClass {
  var string: String

  init(string: String) {
    self.string = string
  }
}

private struct SomeType {
  let bool: Bool
  var mutableString: String
  let someClass: SomeClass
}

struct TypeIntrospectionTests {

  @Test func propertyIntrospection() async throws {
    let introspection = TypeIntrospection(type: SomeType.self)
    #expect(introspection.properties.count == 3)

    var instance = SomeType(bool: true, mutableString: "hello", someClass: SomeClass(string: "world"))
    let boolProperty = introspection.properties[0]
    #expect(!boolProperty.isVar)
    #expect(try boolProperty.getValue(in: instance) as? Bool == true)
    #expect(performing: {
      try boolProperty.setValue(to: false, in: &instance)
    }, throws: { error in
      guard let accessError = error as? PropertyIntrospection.AccessError else {
        return false
      }
      if case .notMutable = accessError {
        return true
      }
      return false
    })

    let stringProperty = introspection.properties[1]
    #expect(stringProperty.isVar)
    #expect(try stringProperty.getValue(in: instance) as? String == "hello")
    try stringProperty.setValue(to: "world", in: &instance)
    #expect(try stringProperty.getValue(in: instance) as? String == "world")

    let classProperty = introspection.properties[2]
    #expect(!classProperty.isVar)
    #expect((try classProperty.getValue(in: instance) as? SomeClass)?.string == "world")
  }

  @Test func instanceTypeSafety() async throws {
    let introspection = TypeIntrospection(type: SomeType.self)
    let instance = Set("some other type")
    let boolProperty = introspection.properties[0]
    #expect(performing: {
      try boolProperty.getValue(in: instance)
    }, throws: { error in
      guard let accessError = error as? PropertyIntrospection.AccessError else {
        return false
      }
      if case .wrongInstanceType = accessError {
        return true
      }
      return false
    })
  }

  @Test func valueTypeSafety() async throws {
    let introspection = TypeIntrospection(type: SomeType.self)
    var instance = SomeType(bool: true, mutableString: "hello", someClass: SomeClass(string: "world"))
    let stringProperty = introspection.properties[1]
    #expect(performing: {
      try stringProperty.setValue(to: false, in: &instance)
    }, throws: { error in
      guard let accessError = error as? PropertyIntrospection.AccessError else {
        return false
      }
      if case .wrongValueType = accessError {
        return true
      }
      return false
    })
  }
}
