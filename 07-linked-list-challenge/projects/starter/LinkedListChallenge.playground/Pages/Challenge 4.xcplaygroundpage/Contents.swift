// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 4: Merge two lists

 Create a function that takes two sorted linked lists and merges them into a single sorted linked list. Your goal is to return a new linked list that contains the nodes from two lists in sorted order. You may assume the sort order is ascending.
 */
func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                _ right: LinkedList<T>) -> LinkedList<T>
{
    var newList = LinkedList<T>()
    
    var currentLeftNode = left.head
    var currentRightNode = right.head
    
    while let leftNode = currentLeftNode,
          let rightNode = currentRightNode
    {
        if leftNode.value > rightNode.value {
            newList.append(rightNode.value)
            currentRightNode = currentRightNode?.next
        } else if leftNode.value < rightNode.value {
            newList.append(leftNode.value)
            currentLeftNode = currentLeftNode?.next
        } else {
            newList.append(rightNode.value)
            newList.append(leftNode.value)
            currentLeftNode = currentLeftNode?.next
            currentRightNode = currentRightNode?.next
        }
    }
    
    while let leftNode = currentLeftNode {
        newList.append(leftNode.value)
        currentLeftNode = currentLeftNode?.next
    }
    
    while let rightNode = currentRightNode {
        newList.append(rightNode.value)
        currentRightNode = currentRightNode?.next
    }
    
    return newList
}

example(of: "merging two lists") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)
  var anotherList = LinkedList<Int>()
  anotherList.push(-1)
  anotherList.push(-2)
  anotherList.push(-3)
  print("First list: \(list)")
  print("Second list: \(anotherList)")
  let mergedList = mergeSorted(list, anotherList)
  print("Merged list: \(mergedList)")
}
//: [Next Challenge](@next)
