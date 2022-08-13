import Foundation

extension RandomAccessCollection where Element: Comparable {
    public func binarySearch(for value: Element,
                             in range: Range<Index>? = nil) -> Index?
    {
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middleIndex = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middleIndex] == value {
            return middleIndex
        } else if self[middleIndex] > value {
            return binarySearch(for: value, in: range.lowerBound..<middleIndex)
        } else {
            return binarySearch(for: value, in: index(after: middleIndex)..<range.upperBound)
        }
    }
}
