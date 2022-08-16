import Foundation

public func merge<Element: Comparable>(_ left: [Element],
                                       _ right: [Element],
                                       by isInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
{
    
    var leftIndex = left.startIndex
    var rightIndex = right.startIndex
    
    var finalResult: [Element] = []
    
    while leftIndex < left.endIndex && rightIndex < right.endIndex {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if isInIncreasingOrder(leftElement, rightElement) {
            finalResult.append(leftElement)
            leftIndex = left.index(after: leftIndex)
        } else if isInIncreasingOrder(rightElement, leftElement) {
            finalResult.append(rightElement)
            rightIndex = right.index(after: rightIndex)
        } else {
            finalResult.append(leftElement)
            finalResult.append(rightElement)
            leftIndex = left.index(after: leftIndex)
            rightIndex = right.index(after: rightIndex)
        }
    }
    
    if leftIndex < left.endIndex {
        finalResult.append(contentsOf: left[leftIndex..<left.endIndex])
    }
    
    if rightIndex < right.endIndex {
        finalResult.append(contentsOf: right[rightIndex..<right.endIndex])
    }
    
    return finalResult
}

public func mergeSort<Element: Comparable>(_ arr: [Element],
                                           by isInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
{
    
    guard arr.count > 1 else {
        return arr
    }
    
    let size = arr.distance(from: arr.startIndex, to: arr.endIndex)
    let middleIndex = arr.index(arr.startIndex, offsetBy: size / 2)
    
    let left = Array(arr[arr.startIndex..<middleIndex])
    let right = Array(arr[middleIndex..<arr.endIndex])
    
    let sortedLeft = mergeSort(left, by: isInIncreasingOrder)
    let sortedRight = mergeSort(right, by: isInIncreasingOrder)
    
    return merge(sortedLeft, sortedRight, by: isInIncreasingOrder)
    
}
