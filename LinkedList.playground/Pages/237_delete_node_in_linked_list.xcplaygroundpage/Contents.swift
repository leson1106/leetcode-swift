//: [Previous](@previous)

import Foundation

extension Solution {
    func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}

//: [Next](@next)
