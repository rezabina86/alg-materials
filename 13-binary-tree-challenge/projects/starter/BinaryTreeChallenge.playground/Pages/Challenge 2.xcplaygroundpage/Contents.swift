// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## #2. Serialization
 
 A common task in software development is serializing an object into another
 data type. This process is known as serialization, and allows custom types to
 be used in systems that only support a closed set of data types.
 
 An example of serialization is JSON. Your task is to devise a way to serialize
 a binary tree into an array, and a way to deserialize the array back into
 the same binary tree.
 
 To clarify this problem, consider the following binary tree:
 
 ![Binary Tree](binary-tree.png)
 
 A particular algorithm may output the serialization as
 `[15, 10, 5, nil, nil, 12, nil, nil, 25, 17, nil, nil, nil]`.
 The deserialization process should transform the array back into the same
 binary tree. Note that there are many ways to perform serialization.
 You may choose any way you wish.
 */

var tree: BinaryNode<Int> = {
  
  let root = BinaryNode(value: 1)
  let two = BinaryNode(value: 2)
  let three = BinaryNode(value: 3)
  let four = BinaryNode(value: 4)
  let five = BinaryNode(value: 5)
  
  root.leftChild = two
  root.rightChild = three
  three.leftChild = four
  three.rightChild = five
  
  return root
}()

print(tree)
var arr = tree.serialize()
print(arr)
let newTree = BinaryNode<Int>.deserialize(&arr)
print(newTree!)
// Your code here

/*
let array = serialize(tree)
print(array)
let node = deserialize(array)
print(node!)
*/
