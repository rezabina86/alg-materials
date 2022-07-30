import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public init() {}
    
    public func node(at index: Int) -> Node<Value>?
    {
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

// MARK: - Adding values to the list
extension LinkedList {
    
    public mutating func push(_ value: Value)
    {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value)
    {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value>
    {
        guard node !== tail else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
}

// MARK: - Removing values from the list
extension LinkedList {
    
    @discardableResult
    public mutating func pop() -> Value?
    {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value?
    {
        guard let head = head else { return nil }
        guard head.next != nil else { return pop() }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value?
    {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}
