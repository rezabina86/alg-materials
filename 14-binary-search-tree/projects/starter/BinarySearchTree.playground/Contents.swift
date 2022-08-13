// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var tree = BinarySearchTree<Int>()
//[8, 806, 2, 4, 56]
tree.insert(8)
tree.insert(806)
tree.insert(2)
tree.insert(4)
tree.insert(56)

print(tree)

tree.remove(806)
print(tree)
