import Testing

import Slipstream

struct StyleModifierTests {

  @Test func defaultComponentNameUsesTypeName() async throws {
    struct MyTestComponent: StyleModifier {
      var style: String { ".test { color: blue; }" }
    }

    let component = MyTestComponent()
    #expect(component.componentName == "MyTestComponent")
  }

  @Test func defaultComponentNameWithGenericType() async throws {
    struct GenericComponent<T: Sendable>: StyleModifier {
      var style: String { ".generic { display: block; }" }
      let value: T
    }

    let component = GenericComponent(value: "test")
    #expect(component.componentName == "GenericComponent<String>")
  }

  @Test func customComponentNameOverridesDefault() async throws {
    struct CustomNameComponent: StyleModifier {
      var style: String { ".custom { margin: 0; }" }
      var componentName: String { "MyCustomName" }
    }

    let component = CustomNameComponent()
    #expect(component.componentName == "MyCustomName")
  }

  @Test func stylePropertyIsRequired() async throws {
    struct MinimalComponent: StyleModifier {
      var style: String {
        """
        .minimal {
          padding: 10px;
        }
        """
      }
    }

    let component = MinimalComponent()
    #expect(component.style.contains(".minimal"))
    #expect(component.style.contains("padding: 10px"))
  }

  @Test func multipleInstancesHaveSameComponentName() async throws {
    struct ReusableComponent: StyleModifier {
      var style: String { ".reusable { width: 100%; }" }
      let id: Int
    }

    let component1 = ReusableComponent(id: 1)
    let component2 = ReusableComponent(id: 2)

    #expect(component1.componentName == component2.componentName)
    #expect(component1.componentName == "ReusableComponent")
  }

  @Test func nestedTypeComponentName() async throws {
    struct OuterComponent {
      struct InnerComponent: StyleModifier {
        var style: String { ".inner { color: red; }" }
      }
    }

    let component = OuterComponent.InnerComponent()
    #expect(component.componentName == "InnerComponent")
  }
}
