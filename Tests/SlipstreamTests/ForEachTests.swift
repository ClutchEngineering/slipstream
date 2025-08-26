import Foundation
import Testing
@testable import Slipstream

struct TestItem: Identifiable {
    let id: String
    let title: String
}

struct TestItemWithoutId {
    let name: String
    let value: Int
}

@Suite
struct ForEachTests {
    
    @Test("ForEach with Identifiable elements")
    func forEachWithIdentifiableElements() throws {
        let items = [
            TestItem(id: "1", title: "First"),
            TestItem(id: "2", title: "Second"),
            TestItem(id: "3", title: "Third")
        ]
        
        let html = try renderHTML(
            ForEach(items) { item in
                Text(item.title)
            }
        )
        
        #expect(html.contains("First"))
        #expect(html.contains("Second"))
        #expect(html.contains("Third"))
    }
    
    @Test("ForEach with custom id keypath")
    func forEachWithCustomKeyPath() throws {
        let items = [
            TestItemWithoutId(name: "Alpha", value: 1),
            TestItemWithoutId(name: "Beta", value: 2),
            TestItemWithoutId(name: "Gamma", value: 3)
        ]
        
        let html = try renderHTML(
            ForEach(items, id: \.name) { item in
                Div {
                    Text(item.name)
                    Text("Value: \(item.value)")
                }
            }
        )
        
        #expect(html.contains("Alpha"))
        #expect(html.contains("Value: 1"))
        #expect(html.contains("Beta"))
        #expect(html.contains("Value: 2"))
        #expect(html.contains("Gamma"))
        #expect(html.contains("Value: 3"))
    }
    
    @Test("ForEach with Links")
    func forEachWithLinks() throws {
        struct NavigationItem {
            let title: String
            let href: String
        }
        
        let navItems = [
            NavigationItem(title: "Home", href: "/"),
            NavigationItem(title: "About", href: "/about"),
            NavigationItem(title: "Contact", href: "/contact")
        ]
        
        let html = try renderHTML(
            ForEach(navItems, id: \.href) { item in
                Link(item.title, destination: URL(string: item.href))
            }
        )
        
        #expect(html.contains("<a href=\"/\">Home</a>"))
        #expect(html.contains("<a href=\"/about\">About</a>"))
        #expect(html.contains("<a href=\"/contact\">Contact</a>"))
    }
    
    @Test("ForEach with modifiers")
    func forEachWithModifiers() throws {
        let items = ["Red", "Green", "Blue"]
        
        let html = try renderHTML(
            ForEach(items, id: \.self) { color in
                Text(color)
                    .textColor(.palette(.red, darkness: 500))
            }
        )
        
        #expect(html.contains("text-red-500"))
        #expect(html.contains("Red"))
        #expect(html.contains("Green"))
        #expect(html.contains("Blue"))
    }
    
    @Test("ForEach empty collection")
    func forEachEmptyCollection() throws {
        let items: [TestItem] = []
        
        let html = try renderHTML(
            Div {
                ForEach(items) { item in
                    Text(item.title)
                }
                Text("No items")
            }
        )
        
        #expect(html.contains("No items"))
        #expect(!html.contains("First"))
    }
}
