import Testing

import Slipstream

struct HasComponentCSSTests {

  @Test func defaultComponentNameUsesTypeName() async throws {
    struct MyTestComponent: HasComponentCSS {
      var componentCSS: String { ".test { color: blue; }" }
    }

    let component = MyTestComponent()
    #expect(component.componentName == "MyTestComponent")
  }

  @Test func defaultComponentNameWithGenericType() async throws {
    struct GenericComponent<T>: HasComponentCSS {
      var componentCSS: String { ".generic { display: block; }" }
      let value: T
    }

    let component = GenericComponent(value: "test")
    #expect(component.componentName == "GenericComponent<String>")
  }

  @Test func customComponentNameOverridesDefault() async throws {
    struct CustomNameComponent: HasComponentCSS {
      var componentCSS: String { ".custom { margin: 0; }" }
      var componentName: String { "MyCustomName" }
    }

    let component = CustomNameComponent()
    #expect(component.componentName == "MyCustomName")
  }

  @Test func componentCSSPropertyIsRequired() async throws {
    struct MinimalComponent: HasComponentCSS {
      var componentCSS: String {
        """
        .minimal {
          padding: 10px;
        }
        """
      }
    }

    let component = MinimalComponent()
    #expect(component.componentCSS.contains(".minimal"))
    #expect(component.componentCSS.contains("padding: 10px"))
  }

  @Test func multipleInstancesHaveSameComponentName() async throws {
    struct ReusableComponent: HasComponentCSS {
      var componentCSS: String { ".reusable { width: 100%; }" }
      let id: Int
    }

    let component1 = ReusableComponent(id: 1)
    let component2 = ReusableComponent(id: 2)

    #expect(component1.componentName == component2.componentName)
    #expect(component1.componentName == "ReusableComponent")
  }

  @Test func nestedTypeComponentName() async throws {
    struct OuterComponent {
      struct InnerComponent: HasComponentCSS {
        var componentCSS: String { ".inner { color: red; }" }
      }
    }

    let component = OuterComponent.InnerComponent()
    #expect(component.componentName == "InnerComponent")
  }
}
