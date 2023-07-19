//: [Previous](@previous)

import Foundation

/*
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.
 
 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 
 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
 */
extension Solution {
    ///Time: `O(2n)`
    ///Space: `O(1)`
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            if head?.next == nil {
                return head
            } else {
                return nil
            }
        }
        
        var totalNode: Int = 0
        var _head = head
        
        while _head != nil {
            _head = _head?.next
            totalNode += 1
        }
        
        let middle = totalNode / 2
        totalNode = 0
        var otherHead = head
        
        while otherHead != nil {
            otherHead = otherHead?.next
            totalNode += 1
            if totalNode == middle {
                return otherHead
            }
        }
        return head
    }
    
    ///2 pointers, which fast is double of slow, so when fast reach end slow should be / 2 of total elements
    ///Time: `O(n)`
    ///Space: `O(1)`
    func middleNode2(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    ///Time: `O(n)`
    ///Space: `O(n)`
    func middleNote3(_ head: ListNode?) -> ListNode? {
        var nodes: [ListNode] = []
        var head = head
        while head != nil {
            nodes.append(head!)
            head = head?.next
        }
        let middle = nodes[nodes.count / 2]
        return middle
    }
}

let list: ListNode? = .init(1, .init(2, .init(3, .init(4, .init(5, .init(6))))))
//let list: ListNode? = .init(1, .init(2))
let result = Solution().middleNode(list)
printNode(result)

//: [Next](@next)
