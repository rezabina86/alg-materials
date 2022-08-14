// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 4. A Min Heap?
 Write a function to check if a given array is a min heap.
 */

func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
}

func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool {
    let size = elements.distance(from: elements.startIndex, to: elements.endIndex)
    let middleIndex = elements.index(elements.startIndex, offsetBy: size / 2)
    var currentIndex = elements.index(before: middleIndex)
    
    while currentIndex >= elements.startIndex {
        
        let leftChildIndex = leftChildIndex(ofParentAt: currentIndex)
        let rightChildIndex = rightChildIndex(ofParentAt: currentIndex)
        
        if leftChildIndex < elements.endIndex && elements[currentIndex] > elements[leftChildIndex] {
            return false
        }
        
        if rightChildIndex < elements.endIndex && elements[currentIndex] > elements[rightChildIndex] {
            return false
        }
        
        currentIndex = elements.index(before: currentIndex)
    }
    
    return true
}

let elements = [1, 3, 12, 5, 10, 18, 21, 6, 8, 11, 15, 100, 20]

isMinHeap(elements: elements)

