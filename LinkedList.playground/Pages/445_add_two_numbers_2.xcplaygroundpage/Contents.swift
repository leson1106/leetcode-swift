//: [Previous](@previous)

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: l1 = [7,2,4,3], l2 = [5,6,4]
 Output: [7,8,0,7]
 
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [8,0,7]
 */
extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var _l1 = reverse(l1)
        var _l2 = reverse(l2)
        
        var result: ListNode? = ListNode(-1)
        
        var currentSurPlus = 0
        
        while let v1 = _l1?.val, let v2 = _l2?.val {
            let newNode = ListNode()
            let value = v1 + v2 + currentSurPlus
            let newValue = (value >= 10) ? (value - 10) : value
            newNode.val = newValue
            currentSurPlus = (value >= 10) ? 1 : 0
            
            result = addNote(newNode, in: result)
            
            _l1 = _l1?.next
            _l2 = _l2?.next
        }
        
        func iterateLastList(_ l: ListNode?) {
            var l = l
            while let v = l?.val {
                let newNode = ListNode()
                newNode.val = (v + currentSurPlus >= 10) ? (0) : (v + currentSurPlus)
                currentSurPlus = (v + currentSurPlus >= 10) ? 1 : 0
                
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
        
        return reverse(result?.next)
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
