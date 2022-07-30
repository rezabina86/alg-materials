// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 5: Remove all occurrences of a specific element

 Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the `remove(at:)` method that you implemented for the linked list.
 */

extension LinkedList where Value: Equatable {
    
    mutating func removeAll(_ value: Value) {
        
        guard !isEmpty else { return }
        
        while let head = head, head.value == value {
            self.head = head.next
        }
        
        var prevNode = head
        var currentNode = prevNode?.next
        
        while currentNode != nil {
            if currentNode?.value == value {
                prevNode?.next = currentNode?.next
                currentNode = prevNode?.next
            } else {
                prevNode = prevNode?.next
                currentNode = currentNode?.next
            }
        }
        
        tail = prevNode
        
    }
    
}

example(of: "deleting duplicate nodes") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(1)
    
    list.removeAll(3)
    print(list)
    print(list.tail)
}
