// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

/*:
 [Previous Challenge](@previous)
 ### Challenge 2: Searching for a range
 Write a function that searches a **sorted** array and that finds the range of indices for a particular element. For example:

```swift
let array = [1, 2, 3, 3, 3, 4, 5, 5]
findIndices(of: 3, in: array)
```

`findIndices` should return the range `2..<5`, since those are the start and end indices for the value `3`.
*/
func findIndices<Elements: RandomAccessCollection>(for element: Elements.Element,
                                                   in collection: Elements) -> Range<Elements.Index>? where Elements.Element: Comparable
{
    guard let firstIndice = firstIndice(for: element, in: collection), let lastIndice = lastIndice(for: element, in: collection) else { return nil }
    return firstIndice..<lastIndice
}

func firstIndice<Elements: RandomAccessCollection>(for element: Elements.Element,
                                                   in collection: Elements,
                                                   in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable
{
    let range = range ?? collection.startIndex..<collection.endIndex
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middleIndex = collection.index(range.lowerBound, offsetBy: size / 2)
    
    if middleIndex == collection.startIndex || middleIndex == collection.index(before: collection.endIndex) {
        if collection[middleIndex] == element {
            return middleIndex
        }
        return nil
    }
    
    if collection[middleIndex] == element {
        let prevIndex = collection.index(before: middleIndex)
        if collection[prevIndex] != element {
            return middleIndex
        } else {
            return firstIndice(for: element, in: collection, in: range.lowerBound..<middleIndex)
        }
    } else if collection[middleIndex] > element {
        return firstIndice(for: element, in: collection, in: range.lowerBound..<middleIndex)
    } else {
        return firstIndice(for: element,in: collection,in: collection.index(after: middleIndex)..<range.upperBound)
    }
}

func lastIndice<Elements: RandomAccessCollection>(for element: Elements.Element,
                                                  in collection: Elements,
                                                  in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable
{
    let range = range ?? collection.startIndex..<collection.endIndex
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middleIndex = collection.index(range.lowerBound, offsetBy: size / 2)
    
    if middleIndex == collection.startIndex || middleIndex == collection.index(before: collection.endIndex) {
        if collection[middleIndex] == element {
            return collection.index(after: middleIndex)
        }
        return nil
    }
    
    if collection[middleIndex] == element {
        let nextIndex = collection.index(after: middleIndex)
        if collection[nextIndex] != element {
            return nextIndex
        } else {
            return firstIndice(for: element,in: collection,in: collection.index(after: middleIndex)..<range.upperBound)
        }
    } else if collection[middleIndex] > element {
        return firstIndice(for: element, in: collection, in: range.lowerBound..<middleIndex)
    } else {
        return firstIndice(for: element,in: collection,in: collection.index(after: middleIndex)..<range.upperBound)
    }
}
