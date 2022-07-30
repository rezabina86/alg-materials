// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Reverse a linked list

 Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
 */
extension LinkedList {
    
    mutating func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            
            current?.next = prev
            prev = current
            current = next
        }
    }
    
}


//: [Next Challenge](@next)
