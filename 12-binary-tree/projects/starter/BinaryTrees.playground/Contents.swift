// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var tree: BinaryNode<Int> = {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)

  seven.leftChild = one
  one.leftChild = zero
  one.rightChild = five
  seven.rightChild = nine
  nine.leftChild = eight

  return seven
}()

print(tree)
print(tree.height)

tree.traverseInOrder { e in
    print(e)
}
