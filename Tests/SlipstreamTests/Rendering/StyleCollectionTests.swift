import Foundation
import Testing
import SwiftSoup

@testable import Slipstream

/// Tests for the automatic CSS style collection system.
///
/// These tests verify:
/// 1. The `style()` method automatically collects CSS from views via `body` traversal
/// 2. Style collection works independently of `render()` implementation
/// 3. CSS collection handles nested components and runtime values correctly
/// 4. Deduplication logic works as expected
final class StyleCollectionTests {
    
    // MARK: - Test Helpers
    
    /// Collects CSS components using the style() method
    private func renderAndCollectCSS(view: any View) async throws -> [any StyleModifier] {
        let styleContext = StyleContext()
        var environment = EnvironmentValues()
        environment.styleContext = styleContext
        
        try await view.style(environment: environment)
        
        return await styleContext.allComponents
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
    
    /// Demonstrates that style() method works even with custom render()
    struct ComponentWithCustomRender: View, StyleModifier {
        typealias Content = Never
        
        var style: String { ".custom { color: blue; }" }
        var componentName: String { "CustomRender" }
        
        // ✅ Custom render() doesn't affect style() - CSS is still collected!
        func render(_ container: Element, environment: EnvironmentValues) throws {
            let element = try container.appendElement("custom")
            try element.appendText("Custom rendered")
        }
    }
    
    /// Shows that style() method collects CSS even with custom render()
    struct ComponentWithManualRegistration: View, StyleModifier {
        typealias Content = Never
        
        var style: String { ".manual { color: green; }" }
        var componentName: String { "ManualRegistration" }
        
        // Custom render() doesn't affect style() collection
        func render(_ container: Element, environment: EnvironmentValues) throws {
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
    func automaticRegistrationForBodyComponent() async throws {
        let components = try await renderAndCollectCSS(view: SimpleComponent())
        
        #expect(components.count == 1)
        #expect(components[0].componentName == "SimpleComponent")
        #expect(components[0].style.contains(".simple { color: red; }"))
    }
    
    @Test("Automatic registration captures runtime values")
    func automaticRegistrationWithRuntimeValues() async throws {
        let component = ComponentWithRuntimeValue(id: "test-tabs", count: 5)
        let components = try await renderAndCollectCSS(view: component)
        
        #expect(components.count == 1)
        #expect(components[0].componentName == "Component[test-tabs]")
        #expect(components[0].style.contains("#test-tabs-item"))
        #expect(components[0].style.contains("with 5 items"))
    }
    
    @Test("Automatic registration works for nested components")
    func automaticRegistrationForNestedComponents() async throws {
        let page = PageWithNestedComponents()
        let components = try await renderAndCollectCSS(view: page)
        
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
    
    // MARK: - Tests: style() Works With Custom Render
    
    @Test("style() method collects CSS even with custom render()")
    func styleMethodWorksWithCustomRender() async throws {
        let component = ComponentWithCustomRender()
        let components = try await renderAndCollectCSS(view: component)
        
        // ✅ style() method is independent of render()
        // Result: Component IS collected even with custom render()
        #expect(components.count == 1)
        #expect(components[0].componentName == "CustomRender")
    }
    
    @Test("style() method works for all components with custom render()")
    func styleMethodWorksForAllCustomRenderComponents() async throws {
        let component = ComponentWithManualRegistration()
        let components = try await renderAndCollectCSS(view: component)
        
        // ✅ style() method collects CSS regardless of custom render()
        #expect(components.count == 1)
        #expect(components[0].componentName == "ManualRegistration")
    }
    
    // MARK: - Tests: Deduplication
    
    @Test("CSS deduplication works (first occurrence wins)")
    func cssDeduplication() async throws {
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
        let components = try await renderAndCollectCSS(view: page)
        
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
