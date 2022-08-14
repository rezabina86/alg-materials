import Foundation

public struct Heap<Element: Equatable> {
    
    public typealias sortMethod = (Element, Element) -> Bool
    
    public private(set) var elements: [Element] = []
    private let sort: sortMethod
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var count: Int {
        elements.count
    }
    
    public init(sort: @escaping sortMethod,
                elements: [Element] = [])
    {
        self.sort = sort
        
        if !elements.isEmpty {
            for element in elements {
                insert(element)
            }
        }
    }
    
    public func peek() -> Element? {
        elements.first
    }
    
    private func leftChildIndex(ofParentAt index: Int) -> Int {
       (2 * index) + 1
    }
    
    private func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    private func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
}

// MARK: - Deletion
extension Heap {
    public mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        
        defer {
            siftDown(from: 0)
        }
        
        return elements.removeLast()
    }
    
    public mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            
            return elements.removeLast()
        }
    }
}

// MARK: - Insertion
extension Heap {
    public mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
}

// MARK: - Finding
extension Heap {
    public func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if elements[i] == element {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }
}
