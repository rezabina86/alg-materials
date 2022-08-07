// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
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

extension BinaryNode {
    
    public func serialize() -> [Element?] {
        serialize(self)
    }
    
    private func serialize(_ node: BinaryNode?) -> [Element?] {
        guard let node = node else { return [nil] }
        return [node.value] + serialize(node.leftChild) + serialize(node.rightChild)
    }
    
    static public func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
        guard let value = array.removeFirst() else { return nil }
        let node = BinaryNode<T>(value: value)
        node.leftChild = deserialize(&array)
        node.rightChild = deserialize(&array)
        return node
    }
    
}
