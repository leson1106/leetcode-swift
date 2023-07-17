//: [Previous](@previous)

import Foundation

extension Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var current = head
        var next: ListNode?
        var prev: ListNode?
        
        while current != nil {
            next = current?.next
            current?.next = prev
            
            prev = current
            current = next
        }
        head = prev
        return head
    }
}

let list1: ListNode? = ListNode(1, .init(2, .init(3, .init(4, .init(5)))))
let result = Solution().reverseList(list1)
printNode(result)

//: [Next](@next)
