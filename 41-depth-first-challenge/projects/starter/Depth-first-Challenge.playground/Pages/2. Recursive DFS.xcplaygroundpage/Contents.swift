// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 2. Recursive DFS
 
 In this chapter we went over an iterative implementation of Depth-first search.
 Now write a recursive implementation.
 */

extension Graph where Element: Hashable {
    
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>]
    {
        var visited: [Vertex<Element>] = []
        var pushed: Set<Vertex<Element>> = []
        dfs(from: source, visited: &visited, pushed: &pushed)
        return visited
    }
    
    func dfs(from source: Vertex<Element>,
             visited: inout [Vertex<Element>],
             pushed: inout Set<Vertex<Element>>)
    {
        visited.append(source)
        pushed.insert(source)
        
        let neighbors = edges(from: source)
        
        for edge in neighbors {
            if !pushed.contains(edge.destination) {
                dfs(from: edge.destination, visited: &visited, pushed: &pushed)
            }
        }
        
    }
    
}

//: ![sampleGraph](sampleGraph.png)

let graph = AdjacencyList<String>()
let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: b, to: e, weight: nil)
graph.add(.undirected, from: c, to: g, weight: nil)
graph.add(.undirected, from: e, to: f, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)
graph.add(.undirected, from: f, to: g, weight: nil)
graph.add(.undirected, from: f, to: c, weight: nil)

let vertices = graph.depthFirstSearch(from: a)
vertices.forEach { vertex in
    print(vertex)
}

//: [Next Challenge](@next)
