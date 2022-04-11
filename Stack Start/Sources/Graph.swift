import Foundation


protocol Graph {
    
    associatedtype Element
    
    typealias Edge = GraphEdge<Element> // 연결된 선
    typealias Vertex = Edge.Vertex // 연결될 요소 하나
    
    var vertices: [Vertex] { get }
    
    @discardableResult mutating func addVertex(_: Element) -> Vertex
    func getEdges(from: Vertex) -> [Edge]
    
}

struct GraphVertex<Element> {
    
    let index: Int
    let element: Element
    
}

// Vertex를 Dictionary keys로 이용하기 위해
extension GraphVertex: Equatable where Element: Equatable { }

extension GraphVertex: Hashable where Element: Hashable { }

struct GraphEdge<Element> {
    
    typealias Vertex = GraphVertex<Element>
    
    let source: Vertex // 출발지
    let destination: Vertex // 도착지
    let weight: Double // 비용 -> 선 사이에 적힌 값.
    
}

// 우선순위 큐를 적용하기 위해
extension GraphEdge: Equatable where Element: Equatable { }
