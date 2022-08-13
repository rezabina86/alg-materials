import Foundation

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else {
            return "Empty Tree"
        }
        return String(describing: root)
    }
}

// MARK: - Insertion
extension BinarySearchTree {
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?,
                        value: Element) -> BinaryNode<Element>?
    {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

// MARK: - Search
extension BinarySearchTree {
    // O(log(n))
    public func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            
            if node.value == value {
                return true
            }
            
            if value > node.value {
                current = node.rightChild
            }
            
            if value < node.value {
                current = node.leftChild
            }
            
        }
        
        return false
    }
}
