package struct PropertyIntrospection {
  init(parentType: Any.Type, index: Int) {
    self.parentType = parentType
    var rawConfiguration: _RawConfiguration = (
      _name: nil,
      _freeNameFunc: nil,
      _isStrong: false,
      _isVar: false
    )
    let type = Self._getChildMetadata(
      _in: parentType,
      _at: index,
      _configuration: &rawConfiguration
    )
    defer {
      rawConfiguration._freeNameFunc?(rawConfiguration._name)
    }
    guard let type else {
      preconditionFailure("Type unexpectedly not returned by _getChildMetadata")
    }
    self.introspection = TypeIntrospection(type: type)
    self.offset = Self._getChildOffset(_in: parentType, _at: index)
    self.isVar = rawConfiguration._isVar
  }

  package let introspection: TypeIntrospection
  package let isVar: Bool

  let offset: Int
  let parentType: Any.Type
}

extension PropertyIntrospection {
  private typealias _RawName = UnsafePointer<CChar>
  private typealias _RawNameRelease = @convention(c) (_RawName?) -> Void

  /// Source: https://github.com/swiftlang/swift/blob/ca0afe2aed9b56714e4237b840c9d3b89b918a94/stdlib/public/SwiftShims/swift/shims/Reflection.h#L25-L30
  private typealias _RawConfiguration = (_name: _RawName?, _freeNameFunc: _RawNameRelease?, _isStrong: Bool, _isVar: Bool)

  /// Source: https://github.com/swiftlang/swift/blob/ca0afe2aed9b56714e4237b840c9d3b89b918a94/stdlib/public/core/ReflectionMirror.swift#L35-L40
  @_silgen_name("swift_reflectionMirror_recursiveChildMetadata")
  private static func _getChildMetadata(_in enclosingType: Any.Type, _at index: Int, _configuration: UnsafeMutablePointer<_RawConfiguration>) -> Any.Type?

  /// Source: https://github.com/swiftlang/swift/blob/ca0afe2aed9b56714e4237b840c9d3b89b918a94/stdlib/public/core/ReflectionMirror.swift#L42-L46
  @_silgen_name("swift_reflectionMirror_recursiveChildOffset")
  private static func _getChildOffset(_in enclosingType: Any.Type, _at index: Int) -> Int
}
