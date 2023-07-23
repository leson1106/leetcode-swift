//: [Previous](@previous)

import Foundation

/*
 You are given the head of a linked list.

 Remove every node which has a node with a strictly greater value anywhere to the right side of it.

 Return the head of the modified linked list.
 
 Input: head = [5,2,13,3,8]
 Output: [13,8]
 Explanation: The nodes that should be removed are 5, 2 and 3.
 - Node 13 is to the right of node 5.
 - Node 13 is to the right of node 2.
 - Node 8 is to the right of node 3.
 
 Input: head = [1,1,1,1]
 Output: [1,1,1,1]
 Explanation: Every node has value 1, so no nodes are removed.
 */
extension Solution {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var head = reverse(head)
        var prev: ListNode?
        var current = head
        
        var max: Int = 0
        
        while let val = current?.val {
            if max < val {
                max = val
            }
            
            if val < max {
                prev?.next = current?.next
            } else {
                prev = current
            }
            current = current?.next
        }
        
        return reverse(head)
    }
    
    func reverse(_ list: ListNode?) -> ListNode? {
        var head = list
        var current = head
        var prev: ListNode? = nil
        var next: ListNode? = nil
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

//: [Next](@next)
