//: [Previous](@previous)

import Foundation

/*
 Given the head of a singly linked list, return true if it is a palindrome or false otherwise.
 Input: head = [1,2,2,1]
 Output: true
 
 Input: head = [1,2]
 Output: false
 */
extension Solution {
    ///Time complexity:
    ///- Iterate head: `O(n)`
    ///- Iterate values using 2 pointers: `O(n)`
    ///=> `O(2n)`
    ///
    ///Space complexity
    ///- Have n of nodes -> `O(n)`
    func isPalindrome(_ head: ListNode?) -> Bool {
        var current = head
        var values: [Int] = []
        
        while current != nil {
            values.append(current!.val)
            current = current?.next
        }
        
        var i: Int = 0
        var j: Int = values.count - 1
        
        while i < j {
            if values[i] != values[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}

class Solution2 {
    ///Time complexity: `O(n)`
    ///Space complexity: `O(n)`
    private var frontPointer: ListNode?
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        frontPointer = head
        return recursiveCheck(frontPointer)
    }
    
    private func recursiveCheck(_ currentNode: ListNode?) -> Bool {
        if currentNode != nil {
            if !recursiveCheck(currentNode?.next)       { return false }
            if currentNode?.val != frontPointer?.val    { return false }
            frontPointer = frontPointer?.next
        }
        return true
    }
}

//let list: ListNode? = ListNode(1, .init(2, .init(3, .init(4, .init(5)))))
let list: ListNode? = ListNode(1, .init(2, .init(2, .init(1))))
//let result = Solution().isPalindrome(list)

let result2 = Solution2().isPalindrome(list)
//: [Next](@next)
