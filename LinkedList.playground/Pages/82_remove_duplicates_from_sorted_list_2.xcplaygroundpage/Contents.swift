//: [Previous](@previous)

import Foundation

/*
 Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.
 */
extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        let dummyHead: ListNode? = ListNode(-1, head)
        
        var pointer = dummyHead
        
        while pointer?.next != nil {
            if let val = pointer?.next?.val, let nextVal = pointer?.next?.next?.val, val == nextVal {
                
                let duplicate = val
                
                while let _val = pointer?.next?.val, _val == duplicate {
                    pointer?.next = pointer?.next?.next
                }
            } else {
                pointer = pointer?.next
            }
        }
        
        return dummyHead?.next
    }
}

let list1 = ListNode(1, .init(1, .init(1, .init(2, .init(3, nil)))))
let list2 = ListNode(1, .init(2, .init(3, .init(3, .init(4, .init(4, .init(5, nil)))))))
let result = Solution().deleteDuplicates(list2)
printNode(list2)

//: [Next](@next)
