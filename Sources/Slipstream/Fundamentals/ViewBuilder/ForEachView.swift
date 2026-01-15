import Foundation
import SwiftSoup

/// A structure that computes views on demand from an underlying collection of data.
///
/// `ForEach` is a declarative way to create views from a collection, similar to SwiftUI's ForEach.
/// It leverages Slipstream's existing `ArrayView` and `ViewBuilder.buildArray` infrastructure
/// to provide type-safe collection rendering without requiring `RawHTML` workarounds.
///
/// ## Usage
///
/// ```swift
/// ForEach(items, id: \.id) { item in
///     Text(item.title)
/// }
/// ```
///
/// ## Key Features
/// - Works with any `RandomAccessCollection`
/// - Requires a key path for element identification
/// - Integrates seamlessly with `@ViewBuilder`
/// - Eliminates need for `RawHTML(array.map{}.joined())` patterns
@_documentation(visibility: private)
@available(iOS 17.0, macOS 14.0, *)
public struct ForEach<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View {
    
    /// The rendered views from the collection
    private let arrayView: ArrayView
    
    /// Creates a ForEach view that iterates over a collection.
    /// - Parameters:
    ///   - data: The collection to iterate over
    ///   - id: Key path to a unique identifier for each element
    ///   - content: ViewBuilder closure that creates content for each element
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        let views = data.map { element in
            content(element)
        }
        self.arrayView = ArrayView(array: views)
    }
    
    public func render(_ container: Element, environment: EnvironmentValues) throws {
        try arrayView.render(container, environment: environment)
    }
    
    public func style(environment: EnvironmentValues) async throws {
        try await arrayView.style(environment: environment)
    }
}

/// Convenience initializer for collections where elements conform to `Identifiable`.
@available(iOS 17.0, macOS 14.0, *)
extension ForEach where Data.Element: Identifiable, ID == Data.Element.ID {
    /// Creates a ForEach view for `Identifiable` elements.
    /// - Parameters:
    ///   - data: The collection to iterate over (elements must be `Identifiable`)
    ///   - content: ViewBuilder closure that creates content for each element
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        let views = data.map { element in
            content(element)
        }
        self.arrayView = ArrayView(array: views)
    }
}
