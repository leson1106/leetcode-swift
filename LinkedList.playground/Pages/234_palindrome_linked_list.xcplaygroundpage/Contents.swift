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
    
    ///Time complexity `O(n)` overall
    ///Space complexity `O(1)`
    func isPalindrome2(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        guard head?.next != nil else { return true }
        
        var slow = head
        var fast = head?.next
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        //even nodes, slow.next should be middle
        if fast != nil {
            slow = slow?.next
        }
        
        //reverse slow end compare with curr
        var prev: ListNode?
        var next: ListNode?
        while slow != nil {
            next = slow?.next
            slow?.next = prev
            prev = slow
            slow = next
        }
        slow = prev
        
        fast = head
        while slow != nil {
            if slow?.val != fast?.val { return false }
            slow = slow?.next
            fast = fast?.next
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

let res3 = Solution().isPalindrome2(.init(1, .init(2, .init(3, .init(4, .init(4, .init(3, .init(2, .init(1, .init(0))))))))))
let res4 = Solution().isPalindrome2(.init(1, .init(2, .init(3, .init(4, .init(4, .init(3, .init(2, .init(1)))))))))
let res5 = Solution().isPalindrome2(.init(1, .init(2)))
let res6 = Solution().isPalindrome2(.init(1))
//: [Next](@next)
