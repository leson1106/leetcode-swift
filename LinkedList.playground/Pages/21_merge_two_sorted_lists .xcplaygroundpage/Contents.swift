//: [Previous](@previous)

import Foundation

extension Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil || list2 == nil {
            return list1 == nil ? list2 : list1
        }
        
        if list1!.val < list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
    }
}

let list1 = ListNode(1, .init(2, .init(4, nil)))
let list2 = ListNode(1, .init(3, .init(4, nil)))
let result = Solution().mergeTwoLists(list1, list2)
printNode(result)

//: [Next](@next)
