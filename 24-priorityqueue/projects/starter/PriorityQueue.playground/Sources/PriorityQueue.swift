import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
    
    private var heap: Heap<Element>
    
    public init(sort: @escaping (Element, Element) -> Bool,
                elements: [Element] = [])
    {
        self.heap = Heap(sort: sort, elements: elements)
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek()
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        heap.remove()
    }
}
