extension PropertyIntrospection {
  package enum AccessError: Error {
    case wrongInstanceType
    case wrongValueType
    case notMutable
  }

  package func getValue<Instance>(in instance: Instance) throws -> Any {
    guard type(of: instance) == parentType else {
      throw AccessError.wrongInstanceType
    }
    return try Self.withRawPointer(_to: instance) { instanceInteriorPointer in
      func withProperValueType<ProperValue>(_: ProperValue.Type) throws -> ProperValue {
        let valuePointer = (instanceInteriorPointer + offset)
          .bindMemory(to: ProperValue.self, capacity: 1)
        return valuePointer.pointee
      }
      return try _openExistential(introspection.type, do: withProperValueType(_:))
    }
  }

  package func setValue<Instance, Value>(to value: Value, in instance: inout Instance) throws {
    guard isVar else {
      throw AccessError.notMutable
    }
    return try Self.withRawMutablePointer(_to: &instance) { instanceInteriorPointer in
      func withProperValueType<ProperValue>(_: ProperValue.Type) throws {
        guard let value = value as? ProperValue else {
          throw AccessError.wrongValueType
        }
        let valuePointer = (instanceInteriorPointer + offset).bindMemory(to: ProperValue.self, capacity: 1)
        valuePointer.pointee = value
      }
      return try _openExistential(introspection.type, do: withProperValueType(_:))
    }
  }
}

extension PropertyIntrospection {
  private static func withRawPointer<Instance, RoutineSuccess>(
    _to instance: Instance,
    _execute routine: (UnsafeRawPointer) throws -> RoutineSuccess
  ) rethrows -> RoutineSuccess {
    return try withUnsafePointer(to: instance) { instancePointer in
      let instanceInteriorPointer = UnsafeRawPointer(instancePointer)
      return try routine(instanceInteriorPointer)
    }
  }

  private static func withRawMutablePointer<Instance, RoutineSuccess>(
    _to instance: inout Instance,
    _execute routine: (UnsafeMutableRawPointer) throws -> RoutineSuccess
  ) rethrows -> RoutineSuccess {
    return try withUnsafeMutablePointer(to: &instance) { instancePointer in
      let instanceInteriorPointer = UnsafeMutableRawPointer(instancePointer)
      return try routine(instanceInteriorPointer)
    }
  }
}
