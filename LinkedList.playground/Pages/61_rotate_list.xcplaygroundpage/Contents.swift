//: [Previous](@previous)

import Foundation

/*
 Given the head of a linked list, rotate the list to the right by k places.
 
 Input: head = [1,2,3,4,5], k = 2
 Output: [4,5,1,2,3]
 
 Input: head = [0,1,2], k = 4
 Output: [2,0,1]
 */
extension Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var pointer = head
        var length: Int = 1
        
        //Find length
        while pointer?.next != nil {
            pointer = pointer?.next
            length += 1
        }
        
        //Make cycle
        pointer?.next = head
        
        //Move pointer to next position with k
        for _ in 0..<length - k % length {
            pointer = pointer?.next
        }
        
        //Make new pointer to position
        let new = pointer?.next
        //Disconnect old pointer
        pointer?.next = nil
        
        return new
    }
}

let k = 4
let result = 4 % 5

//: [Next](@next)
