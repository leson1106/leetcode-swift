//: [Previous](@previous)

import Foundation

extension Solution {
    ///time: `O(m + n)` (m & n is length of headA/B)
    ///space: `O(1)`
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB
        
        while a !== b {
            a = (a == nil) ? headB : a?.next
            b = (b == nil) ? headA : b?.next
        }
        
        return a
    }
}

//: [Next](@next)
