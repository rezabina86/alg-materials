import Foundation

public class AdjacencyList<T: Hashable> {
    public var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graph {
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: self.adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>,
                                to destination: Vertex<T>,
                                weight: Double?)
    {
        let edge = Edge(source: source,
                        destination: destination,
                        weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    public func addUndirectedEdge(from source: Vertex<T>,
                                  to destination: Vertex<T>,
                                  weight: Double?)
    {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType,
                    from source: Vertex<T>,
                    to destination: Vertex<T>,
                    weight: Double?)
    {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(from: source, to: destination, weight: weight)
        }
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<T>,
                       to destination: Vertex<T>) -> Double?
    {
        edges(from: source).first(where: { $0.destination == destination })?.weight
    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) -> [\(edgeString)]\n")
        }
        return result
    }
}
