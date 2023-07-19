//: [Previous](@previous)

import Foundation

/*
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 
 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.

 Input: head = [1], pos = -1
 Output: false
 Explanation: There is no cycle in the linked list.
 */

//Travel 2 pointers through list if 2 match references so its a cycle linked list
//This is cycle linked list at node = 6
//          1 - 2 - 3 - 4 - 5 - 6 - 3 - 4 - 5 - 6...
//Step 1:  c=n
//Step 2:       c   n => c != n
//Step 3:           c       n => c != n
//Step n: ... c = n = 6 => return true otherwise its false
extension Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var current = head
        var next = head
        
        while next != nil, next?.next != nil {
            next = next?.next?.next
            current = current?.next
            if next === current {
                return true
            }
        }
        
        return false
    }
}

//: [Next](@next)
