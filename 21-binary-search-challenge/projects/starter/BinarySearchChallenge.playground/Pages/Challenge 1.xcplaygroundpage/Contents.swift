// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
# Binary Search Challenge

 ### Challenge 1: Binary search as a free function

 Implement binary search as a free function. You should be able to run:

 ```swift
 let array = [1, 2, 10, 43, 55, 60, 150, 1420]
 binarySearch(for: 10, in: array) == 2
 ```
 
 */
func binarySearch<Elements: RandomAccessCollection>(for element: Elements.Element,
                                                    in collection: Elements,
                                                    in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable
{
    let range = range ?? collection.startIndex..<collection.endIndex
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middleIndex = collection.index(range.lowerBound, offsetBy: size / 2)

    if collection[middleIndex] == element {
        return middleIndex
    } else if collection[middleIndex] > element {
        return binarySearch(for: element, in: collection, in: range.lowerBound..<middleIndex)
    } else {
        return binarySearch(for:element, in: collection, in: collection.index(after: middleIndex)..<range.upperBound)
    }
}
/*:
 [Next Challenge](@next)
 */
