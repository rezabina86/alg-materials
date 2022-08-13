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
    return nil
}


let array = [1, 2, 3, 3, 3, 4, 5, 5]
let indices = findIndices(for: 3, in: array)
print(indices)
