// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    var isLeaf: Bool {
        rightChild == nil && leftChild == nil
    }
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension BinaryNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode where Element: Comparable {
    
    public var isBST: Bool {
        isBST(node: self, min: nil, max: nil)
    }
    
    private func isBST(node: BinaryNode<Element>?,
                       min: Element?,
                       max: Element?) -> Bool
    {
        
        guard let node = node else { return true }
        
        if let min = min, node.value < min {
            return false
        } else if let max = max, node.value > max {
            return false
        }
        
        return isBST(node: node.leftChild, min: min, max: node.value) &&
        isBST(node: node.rightChild, min: node.value, max: max)
    }
    
}

extension BinaryNode: Equatable where Element: Comparable {
    public static func == (lhs: BinaryNode<Element>, rhs: BinaryNode<Element>) -> Bool {
        if (lhs.isLeaf) && (rhs.isLeaf) {
            return lhs.value == rhs.value
        }
        
        if lhs.isLeaf && !rhs.isLeaf {
            return false
        }
        
        if !lhs.isLeaf && rhs.isLeaf {
            return false
        }
        
        return (lhs.value == rhs.value) && (lhs.leftChild == rhs.leftChild) && (lhs.rightChild == rhs.rightChild)
    }
}


