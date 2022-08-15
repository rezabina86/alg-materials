// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## 2. Prioritize a Waitlist
 
 Your favorite T-Swift concert was sold out. Fortunately there is a waitlist for people who still want to go! However the ticket sales will first prioritize someone with a **military background**, followed by **seniority**. Write a `sort` function that will return the list of people on the waitlist by the priority mentioned.
 */

public struct Person: Equatable {
  let name: String
  let age: Int
  let isMilitary: Bool
}

let p1 = Person(name: "Josh", age: 21, isMilitary: true)
let p2 = Person(name: "Jake", age: 22, isMilitary: true)
let p3 = Person(name: "Clay", age: 28, isMilitary: false)
let p4 = Person(name: "Cindy", age: 28, isMilitary: false)
let p5 = Person(name: "Sabrina", age: 30, isMilitary: false)

let waitlist = [p1, p2, p3, p4, p5]

var queue = PriorityQueue(sort: { p1, p2 in
    if p1.isMilitary == p2.isMilitary {
        return p1.age > p2.age
    }
    return p1.isMilitary
}, elements: waitlist)

while !queue.isEmpty {
    print(queue.dequeue()?.name)
}
