//: [Previous](@previous)

import Foundation

extension Solution {
    ///First approach, convert linked list to array then find the middle index
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    func middleNode(_ head: ListNode?) -> ListNode? {
        var nodes: [ListNode] = []
        var head = head
        while head != nil {
            nodes.append(head!)
            head = head?.next
        }
        let middle = nodes[nodes.count / 2]
        return middle
    }
    
    ///Iterate through linked list
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}

//: [Next](@next)
