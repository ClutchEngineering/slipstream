extension TypeIntrospection {
  package struct Properties {
    init(parent: TypeIntrospection) {
      self.parent = parent
    }

    let parent: TypeIntrospection
  }
}

extension TypeIntrospection.Properties: Collection {
  package typealias Element = PropertyIntrospection
  package typealias Index = Int

  package var count: Int {
    Self._getRecursiveChildCount(_in: parent.type)
  }

  package var startIndex: Index {
    return .zero
  }

  package var endIndex: Index {
    return count
  }

  package func index(after anotherIndex: Index) -> Index {
    return anotherIndex + 1
  }

  package subscript(_ index: Index) -> Element {
    return PropertyIntrospection(parentType: parent.type, index: index)
  }
}

extension TypeIntrospection.Properties {
  @_silgen_name("swift_reflectionMirror_recursiveCount")
  private static func _getRecursiveChildCount(_in type: Any.Type) -> Int
}
