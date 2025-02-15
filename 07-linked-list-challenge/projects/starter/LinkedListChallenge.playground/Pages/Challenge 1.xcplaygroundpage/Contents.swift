// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 # Linked List Challenges
 ## Challenge 1: Print in reverse
 
 Create a function that prints the nodes of a linked list in reverse order.
 */
func printInReverse<T>(_ list: LinkedList<T>) {
    printNodeInReverse(list.head)
}

func printNodeInReverse<T>(_ node: Node<T>?) {
    guard let node = node else { return }
    printNodeInReverse(node.next)
    print(node.value)
}
//: [Next Challenge](@next)
