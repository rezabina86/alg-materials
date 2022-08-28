// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # 1. Count the Number of Paths
 
 Write a method to count the number of paths between two vertices in a directed graph.
 */

import Darwin
struct Queue<T> {
    private(set) var array: [T] = []
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.last
    }
    
    public mutating func enqueue(_ element: T) {
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.popLast()
    }
}


extension Graph where Element: Hashable {
    
    public func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        guard source != destination else { return 0 }
        var numberOfPaths = 0
        var queue = Queue<Vertex<Element>>()
        
        queue.enqueue(source)
        
        while let vertex = queue.dequeue() {
            if vertex == destination {
                numberOfPaths += 1
            }
            
            for edge in self.edges(from: vertex) {
                queue.enqueue(edge.destination)
            }
        }
        
        return numberOfPaths
    }
}

//: ![numberOfPaths](numberOfPaths.png)

let graph = AdjacencyList<String>()

let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")

graph.add(.directed, from: a, to: b, weight: 0)
graph.add(.directed, from: a, to: d, weight: 0)
graph.add(.directed, from: a, to: e, weight: 0)
graph.add(.directed, from: a, to: c, weight: 0)
graph.add(.directed, from: b, to: d, weight: 0)
graph.add(.directed, from: b, to: c, weight: 0)
graph.add(.directed, from: d, to: e, weight: 0)
graph.add(.directed, from: c, to: e, weight: 0)

print(graph)
print("Number of paths: \(graph.numberOfPaths(from: d, to: d))")

//: [Next Challenge](@next)
