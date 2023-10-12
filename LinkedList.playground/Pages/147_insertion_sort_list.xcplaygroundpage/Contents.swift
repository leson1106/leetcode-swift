//: [Previous](@previous)

import Foundation

extension Solution {
    ///Insertion sort
    ///Time complexity `O(n^2)`
    ///Space complexity `O(1)`
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var current = head
        let res: ListNode? = .init(-99)
        
        while current != nil {
            var prev = res
            
            while prev?.next != nil && prev!.next!.val <= current!.val {
                prev = prev?.next
            }
            
            let next = current?.next
            current?.next = prev?.next
            prev?.next = current
            
            current = next
        }
        
        return res?.next
    }
}

let res = Solution().insertionSortList(.init(4, .init(2, .init(1, .init(3)))))
let res1 = Solution().insertionSortList(.init(-1, .init(5, .init(3, .init(4, .init(0)))))

//: [Next](@next)
