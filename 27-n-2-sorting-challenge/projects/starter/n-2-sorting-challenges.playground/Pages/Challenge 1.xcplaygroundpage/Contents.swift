// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: # n² Sorting Challenges
//: ## Challenge 1: Group elements
//: Given a collection of Equatable elements, bring all instances of a given
//: value in the array to the right side of the array.

// Your code here

var array = [3, 4, 134, 3, 5, 6, 3, 5, 6, 1, 0]

extension MutableCollection where Element: Comparable {
    
    public mutating func rightAlign(value: Element) {
        guard self.count > 1 else { return }
        for currentIndex in self.indices {
            if self[currentIndex] == value {
                
                var shifting = currentIndex
                var nextIndex = self.index(after: shifting)
                
                while nextIndex < self.endIndex {
                    self.swapAt(shifting, nextIndex)
                    shifting = self.index(after: shifting)
                    nextIndex = self.index(after: nextIndex)
                }
            }
        }
    }
    
}

array.rightAlign(value: 3)
print(array)

//: [Next Challenge](@next)
