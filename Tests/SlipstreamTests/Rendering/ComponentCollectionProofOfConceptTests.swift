import Foundation
import Testing
import SwiftSoup

@testable import Slipstream

/// Tests documenting the automatic CSS collection architecture and its limitations.
///
/// These tests demonstrate:
/// 1. Automatic registration works for views using `body`
/// 2. Custom `render()` implementations override the protocol extension (architectural limitation)
/// 3. Manual registration helper is available for the custom render() edge case
final class AutomaticCSSRegistrationTests {
    
    // MARK: - Test Helpers
    
    /// Simulates rendering and collects CSS components
    private func renderAndCollectCSS(view: any View) throws -> [any StyleModifier] {
        let context = StyleContext()
        var environment = EnvironmentValues()
        environment.styleContext = context
        
        let document = Document("/")
        try view.render(document, environment: environment)
        
        return context.allComponents
    }
    
    // MARK: - Test Components
    
    struct SimpleComponent: View, StyleModifier {
        var style: String { ".simple { color: red; }" }
        var componentName: String { "SimpleComponent" }
        var body: some View { Text("Simple") }
    }
    
    struct ComponentWithRuntimeValue: View, StyleModifier {
        let id: String
        let count: Int
        
        var style: String {
            """
            /* Component[\(id)] with \(count) items */
            #\(id)-item { display: block; }
            """
        }
        
        var componentName: String { "Component[\(id)]" }
        
        var body: some View {
            Div {
                Text("Runtime: \(id)")
            }
        }
    }
    
    /// Demonstrates the architectural limitation: custom render() overrides protocol extension
    struct ComponentWithCustomRender: View, StyleModifier {
        var style: String { ".custom { color: blue; }" }
        var componentName: String { "CustomRender" }
        
        // ❌ This custom render() OVERRIDES the protocol extension's render()
        // Result: Component is NOT automatically registered
        func render(_ container: Element, environment: EnvironmentValues) throws {
            let element = try container.appendElement("custom")
            try element.appendText("Custom rendered")
        }
    }
    
    /// Shows the workaround: manual registration in custom render()
    struct ComponentWithManualRegistration: View, StyleModifier {
        var style: String { ".manual { color: green; }" }
        var componentName: String { "ManualRegistration" }
        
        func render(_ container: Element, environment: EnvironmentValues) throws {
            // ✅ Manually register before custom render logic
            environment.styleContext?.add(self)
            
            let element = try container.appendElement("manual")
            try element.appendText("Manually registered")
        }
    }
    
    struct PageWithNestedComponents: View {
        var body: some View {
            Div {
                SimpleComponent()
                ComponentWithRuntimeValue(id: "header", count: 3)
                ComponentWithRuntimeValue(id: "footer", count: 2)
            }
        }
    }
    
    // MARK: - Tests: Automatic Registration (Works)
    
    @Test("Automatic registration works for simple component with body")
    func automaticRegistrationForBodyComponent() throws {
        let components = try renderAndCollectCSS(view: SimpleComponent())
        
        #expect(components.count == 1)
        #expect(components[0].componentName == "SimpleComponent")
        #expect(components[0].style.contains(".simple { color: red; }"))
    }
    
    @Test("Automatic registration captures runtime values")
    func automaticRegistrationWithRuntimeValues() throws {
        let component = ComponentWithRuntimeValue(id: "test-tabs", count: 5)
        let components = try renderAndCollectCSS(view: component)
        
        #expect(components.count == 1)
        #expect(components[0].componentName == "Component[test-tabs]")
        #expect(components[0].style.contains("#test-tabs-item"))
        #expect(components[0].style.contains("with 5 items"))
    }
    
    @Test("Automatic registration works for nested components")
    func automaticRegistrationForNestedComponents() throws {
        let page = PageWithNestedComponents()
        let components = try renderAndCollectCSS(view: page)
        
        // Should automatically find all 3 nested components
        #expect(components.count == 3)
        
        let names = components.map { $0.componentName }
        #expect(names.contains("SimpleComponent"))
        #expect(names.contains("Component[header]"))
        #expect(names.contains("Component[footer]"))
        
        // Verify runtime values are correct
        let headerComponent = components.first { $0.componentName == "Component[header]" }
        #expect(headerComponent?.style.contains("with 3 items") == true)
        
        let footerComponent = components.first { $0.componentName == "Component[footer]" }
        #expect(footerComponent?.style.contains("with 2 items") == true)
    }
    
    // MARK: - Tests: Custom Render Limitation
    
    @Test("Custom render() overrides protocol extension - component NOT registered")
    func customRenderOverridesAutomaticRegistration() throws {
        let component = ComponentWithCustomRender()
        let components = try renderAndCollectCSS(view: component)
        
        // ❌ ARCHITECTURAL LIMITATION: Custom render() overrides the protocol extension
        // Result: Component is NOT automatically registered
        #expect(components.isEmpty)
    }
    
    @Test("Manual registration workaround for custom render()")
    func manualRegistrationWorksForCustomRender() throws {
        let component = ComponentWithManualRegistration()
        let components = try renderAndCollectCSS(view: component)
        
        // ✅ Manual registration in custom render() works
        #expect(components.count == 1)
        #expect(components[0].componentName == "ManualRegistration")
    }
    
    // MARK: - Tests: Deduplication
    
    @Test("CSS deduplication works (first occurrence wins)")
    func cssDeduplication() throws {
        struct DupeA: View, StyleModifier {
            var style: String { ".dupe { margin: 10px; }" }
            var componentName: String { "DupeA" }
            var body: some View { Text("A") }
        }
        
        struct DupeB: View, StyleModifier {
            var style: String { ".dupe { margin: 10px; }" }
            var componentName: String { "DupeB" }
            var body: some View { Text("B") }
        }
        
        struct PageWithDupes: View {
            var body: some View {
                Div {
                    DupeA()
                    DupeB()
                }
            }
        }
        
        let page = PageWithDupes()
        let components = try renderAndCollectCSS(view: page)
        
        // Both components collected
        #expect(components.count == 2)
        
        // Deduplication by CSS content (simulating renderStyles behavior)
        var seenCSS = Set<String>()
        let uniqueComponents = components.filter { component in
            seenCSS.insert(component.style).inserted
        }
        
        // Only first occurrence remains after deduplication
        #expect(uniqueComponents.count == 1)
        #expect(uniqueComponents[0].componentName == "DupeA")
    }
}
