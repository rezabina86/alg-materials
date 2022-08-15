import Foundation

extension MutableCollection where Element: Comparable {
    
    public mutating func bubbleSort(by isInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        var swapped = false
        var currentIndex = self.startIndex
        var nextIndex = self.index(after: currentIndex)
        
        while nextIndex < self.endIndex {
            let currentElement = self[currentIndex]
            let nextElement = self[nextIndex]
            
            if !isInIncreasingOrder(currentElement, nextElement) {
                swapped = true
                self.swapAt(currentIndex, nextIndex)
            }
            
            currentIndex = self.index(after: currentIndex)
            nextIndex = self.index(after: currentIndex)
            
            if nextIndex == self.endIndex && swapped {
                currentIndex = self.startIndex
                nextIndex = self.index(after: currentIndex)
                swapped = false
            }
        }
        
    }
    
    public mutating func selectionSort(by isInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        
        guard self.count > 1 else { return }
        
        var currentIndex = self.startIndex
        
        while currentIndex < self.endIndex {
            var lowestIndex = currentIndex
            var nextIndex = self.index(after: currentIndex)
            
            while nextIndex < self.endIndex {
                let lowestElement = self[lowestIndex]
                let nextElement = self[nextIndex]
                
                if !(isInIncreasingOrder(lowestElement, nextElement)) {
                    lowestIndex = nextIndex
                }
                
                nextIndex = self.index(after: nextIndex)
            }
            
            if lowestIndex != currentIndex {
                self.swapAt(lowestIndex, currentIndex)
            }
            
            currentIndex = self.index(after: currentIndex)
        }
        
    }
    
    public mutating func insertionSort(by isInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        
        guard self.count > 1 else { return }
        
        for current in self.indices {
            var shifting = current
            while shifting > self.startIndex {
                let prev = self.index(shifting, offsetBy: -1)
                if !(isInIncreasingOrder(self[prev], self[shifting])) {
                    self.swapAt(shifting, prev)
                }
                shifting = prev
            }
        }
    }
    
}






