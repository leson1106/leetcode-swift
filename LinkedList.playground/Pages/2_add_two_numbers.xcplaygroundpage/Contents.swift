//: [Previous](@previous)

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 
 Input: l1 = [0], l2 = [0]
 Output: [0]
 
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */
extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var _l1 = l1
        var _l2 = l2
        
        var result: ListNode? = ListNode(-1)
        
        var currentSurPlus = 0
        
        while let v1 = _l1?.val, let v2 = _l2?.val {
            let newNode = ListNode()
            let value = v1 + v2 + currentSurPlus
            let newValue = value % 10
            newNode.val = newValue
            currentSurPlus = value / 10
            
            result = addNote(newNode, in: result)
            
            _l1 = _l1?.next
            _l2 = _l2?.next
        }
        
        func iterateLastList(_ l: ListNode?) {
            var l = l
            while let v = l?.val {
                let newNode = ListNode()
                let value = v + currentSurPlus
                newNode.val = value % 10
                currentSurPlus = value / 10
                
                result = addNote(newNode, in: result)
                
                l = l?.next
            }
        }
        
        if _l1 == nil || _l2 == nil {
            _l1 == nil ? iterateLastList(_l2) : iterateLastList(_l1)
        }
        
        if currentSurPlus > 0 {
            let lastNode = ListNode()
            lastNode.val = currentSurPlus
            
            result = addNote(lastNode, in: result)
        }
        
        return result?.next
    }
    
    func addNote(_ node: ListNode?, in list: ListNode?) -> ListNode? {
        let prev = list
        var head = list
        
        if list?.next == nil {
            head?.next = node
        } else {
            while head?.next != nil {
                head = head?.next
            }
            head?.next = node
        }
        return prev
    }
}

//let list1: ListNode? = ListNode(5, .init(6, .init(4, .init(9))))
//let list2: ListNode? = ListNode(2, .init(4, .init(9)))
//let list1: ListNode? = ListNode(2, .init(4, .init(3)))
//let list2: ListNode? = ListNode(5, .init(6, .init(4)))
let list1: ListNode? = ListNode(9, .init(9, .init(9, .init(9))))
let list2: ListNode? = ListNode(9, .init(9, .init(9, .init(9, .init(9, .init(9, .init(9)))))))
//let list1: ListNode? = ListNode(9, .init(9, .init(1)))
//let list2: ListNode? = ListNode(1)
//let list1: ListNode? = ListNode(3, .init(7))
//let list2: ListNode? = ListNode(9, .init(2))
let result = Solution().addTwoNumbers(list1, list2)
printNode(result)

//: [Next](@next)
