// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

let array = [55,0,1,45,22,56,3,9,0,10]

var heap = Heap(sort: { $0 < $1 }, elements: array)

while !heap.isEmpty {
    print(heap.remove())
}
