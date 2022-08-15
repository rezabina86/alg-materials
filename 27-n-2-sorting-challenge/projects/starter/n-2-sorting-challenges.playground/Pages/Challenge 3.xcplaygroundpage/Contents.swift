// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 3: Reverse a collection
//: Reverse a collection of elements by hand. Do not rely on the
//: reverse or reversed methods.

extension MutableCollection where Self: BidirectionalCollection {
    
    public mutating func customReverse() {
        guard self.count > 1 else { return }
        var leftIndex = self.startIndex
        var rightIndex = self.index(before: self.endIndex)
        
        while leftIndex < rightIndex {
            
            self.swapAt(leftIndex, rightIndex)
            
            leftIndex = self.index(after: leftIndex)
            rightIndex = self.index(before: rightIndex)
        }
    }
    
}

var arr = [1,2,3,4,5,6,7,8,9]
arr.customReverse()
print(arr)
