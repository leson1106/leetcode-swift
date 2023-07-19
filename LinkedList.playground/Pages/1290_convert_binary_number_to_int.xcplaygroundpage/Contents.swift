//: [Previous](@previous)

import Foundation

/*
 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.

 Return the decimal value of the number in the linked list.

 The most significant bit is at the head of the linked list.
 */
extension Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var binaryStr = ""
        var head = head
        
        while head != nil {
            binaryStr += "\(head!.val)"
            head = head?.next
        }
        
        return Int(binaryStr, radix: 2)!
    }
    
    func getDecimalValue2(_ head: ListNode?) -> Int {
        var num = 0
        var head = head
        while head != nil {
            num = num * 2 + head!.val
            head = head?.next
        }
        return num
    }
    
    ///bitwise
    func getDecimalValue3(_ head: ListNode?) -> Int {
        var num = 0
        var head = head
        while head != nil {
            num = (num << 1) | head!.val
            head = head?.next
        }
        return num
    }
}

//: [Next](@next)
