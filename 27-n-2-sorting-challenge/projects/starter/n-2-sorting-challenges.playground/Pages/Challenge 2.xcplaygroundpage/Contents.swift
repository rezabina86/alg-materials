// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 2: Find a duplicate
//: Given a collection of Equatable elements, return the first element
//: that is a duplicate in the collection.
extension RandomAccessCollection where Element: Hashable {
    public func firstDuplicate() -> Element? {
        var hashTable = Set<Element>()
        for element in self {
            if hashTable.contains(element) {
                return element
            } else {
                hashTable.insert(element)
            }
        }
        return nil
    }
}

let array = [2, 4, 5, 5, 2]
let d = array.firstDuplicate()


//: [Next Challenge](@next)
